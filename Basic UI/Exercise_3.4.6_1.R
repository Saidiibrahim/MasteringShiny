library(shiny)


ui <- fluidPage(
  fluidRow(
    plotOutput("plot1")
  ),
  fluidRow(
    plotOutput("plot2")
  )
)
  

server <- function(input, output, session) {
  output$plot1 <- renderPlot(plot(datasets::attitude))
  output$plot2 <- renderPlot(plot(datasets::DNase))
}

shinyApp(ui, server)
