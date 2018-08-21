library(shiny)

shinyUI(fluidPage(
  titlePanel("Iris Data Set"),
  sidebarLayout(
    sidebarPanel(
      numericInput("Sepal.Length", "Sepal Length", 6.1,  
                   min = 4.3, max = 7.9, step = 0.1),
      numericInput("Sepal.Width", "Sepal Width", 2.6,  
                   min = 2, max = 4.4, step = 0.1),
      numericInput("Petal.Length", "Petal Length", 5.6,  
                   min = 1, max = 6.9, step = 0.1),
      numericInput("Petal.Width", "Petal Width", 1.4,  
                   min = 0.1, max = 2.5, step = 0.1),
      submitButton("Submit")
    ),
    mainPanel(
      h3("Prediction result"),
      textOutput("pred_CT"),
      textOutput("pred_RF"),
      textOutput("pred_GBM")
    )
  )
))
