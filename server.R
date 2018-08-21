library(shiny)
library(caret)
library(e1071)
library(randomForest)
library(gbm)

data(iris)

trControl <- trainControl(method = "cv", number = 5)

model_CT <- train(Species ~ ., data = iris,  
                  method = "rpart", trControl = trControl)
model_RF <- train(Species ~ ., data = iris,  
                  method = "rf", trControl = trControl)
model_GBM <- train(Species ~ ., data = iris, verbose = FALSE,
                   method = "gbm", trControl = trControl)

shinyServer(function(input, output) {
      output$pred_CT <- renderText({
          Sepal.Length <- as.numeric(input$Sepal.Length)
          Sepal.Width <- as.numeric(input$Sepal.Width)
          Petal.Length <- as.numeric(input$Petal.Length)
          Petal.Width <- as.numeric(input$Petal.Width)
          newdata <- data.frame(Sepal.Length = Sepal.Length,
                                Sepal.Width = Sepal.Width,
                                Petal.Length = Petal.Length,
                                Petal.Width = Petal.Width)

          paste("Classification Tree:",
                as.character(predict(model_CT, newdata)))
      })
  
      output$pred_RF <- renderText({
          Sepal.Length <- as.numeric(input$Sepal.Length)
          Sepal.Width <- as.numeric(input$Sepal.Width)
          Petal.Length <- as.numeric(input$Petal.Length)
          Petal.Width <- as.numeric(input$Petal.Width)
          newdata <- data.frame(Sepal.Length = Sepal.Length,
                                Sepal.Width = Sepal.Width,
                                Petal.Length = Petal.Length,
                                Petal.Width = Petal.Width)
          paste("Random Forest:",
                as.character(predict(model_RF, newdata)))
      })
    
      output$pred_GBM <- renderText({
          Sepal.Length <- as.numeric(input$Sepal.Length)
          Sepal.Width <- as.numeric(input$Sepal.Width)
          Petal.Length <- as.numeric(input$Petal.Length)
          Petal.Width <- as.numeric(input$Petal.Width)
          newdata <- data.frame(Sepal.Length = Sepal.Length,
                                Sepal.Width = Sepal.Width,
                                Petal.Length = Petal.Length,
                                Petal.Width = Petal.Width)
          paste("Gradient Boosting:",
                as.character(predict(model_GBM, newdata)))
      })
      
})
