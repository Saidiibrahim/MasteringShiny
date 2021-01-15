library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?", placeholder = "Your name")
)


server <- function(input, output, session) {
  
}

shinyApp(ui, server)
