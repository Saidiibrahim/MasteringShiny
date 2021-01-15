library(shiny)

ui <- fluidPage(
  numericInput("number", "Select a value", value = 150, min = 0, max = 1000, step = 50)
) # step arg: Interval to use when stepping between min and max

server <- function(input, output, session) {
  
}

shinyApp(ui, server)

