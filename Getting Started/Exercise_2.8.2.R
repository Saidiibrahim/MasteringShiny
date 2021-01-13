library(shiny)

ui <- fluidPage(
  sliderInput("x", "if x is", min = 1, max = 50, value = 30),
  "then x times 5 is",
  textOutput("product")
)


server <- function(input, output, session) {
  output$product <- renderText({
    input$x * 5     # Forgot to access x via input$x
  })
}

shinyApp(ui, server)
