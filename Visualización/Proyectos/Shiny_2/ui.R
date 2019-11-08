library(shiny)
library(ggplot2)
shinyUI(
  fluidPage(
    titlePanel("SHINY 2"),
    sidebarLayout(
      sidebarPanel(
          selectInput("varX", label = h3("Variable X"),
                      choices = list("Cilindros" = "cyl","Highway" = "hwy","Tamaño" = "displ","City" = "cty"),
                      selected = "cyl"),
          selectInput("varY", label = h3("Variable Y"),
                      choices = list("Cilindros" = "cyl","Highway" = "hwy","Tamaño" = "displ","City" = "cty"),
                      selected = "hwy")
        ),
        mainPanel(
          textOutput("texto"),
          plotOutput("grafica")
        )
    )
  )
)

