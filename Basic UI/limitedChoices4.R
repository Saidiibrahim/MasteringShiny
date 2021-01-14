library(shiny)

ui <- fluidPage(
  checkboxGroupInput("animal", "What animals do you like?", animals)
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
