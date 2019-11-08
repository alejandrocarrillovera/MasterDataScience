library(ggplot2)
shinyServer(function(input,output){
  
  output$texto <- renderText({
    paste0("Este es el gráfico de: ", input$varX, " x ", input$varY)
  })
  output$grafica <- renderPlot({
    ggplot(mpg,aes_string(x = input$varX , y = input$varY)) + geom_point()
  })
  
  })