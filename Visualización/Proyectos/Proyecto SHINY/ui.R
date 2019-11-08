###SHINY###
library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Old Faithful Geyser Data"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("nBins", label = "Número de Agrupaciones", 
                    min = 1, max = 100, value = 10)
      ),
      mainPanel(
        plotOutput("miOutputFavorito")
      )
    )
  )
)