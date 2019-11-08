library(shiny)

ui <- fluidPage(
    titlePanel("Old Faithful Geyser Data"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("size",label = "Tamaño Muestral", min = 5, max = 500 , value = 250),
            selectInput("dist", label = "Distribución", 
                        choices = list("Gaussiana" = "norm","Uniforme" = "unif"),
                        selected = "norm"),
            actionButton("ejecutar", label = "Cobrar 50 euros")
        ),
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

server <- function(input, output) {

    output$distPlot <- renderPlot({
        input$ejecutar
        rdistribucion <- ifelse(isolate(input$dist) == "norm",rnorm,runif)
        hist(rdistribucion(isolate(input$size)))
      
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
