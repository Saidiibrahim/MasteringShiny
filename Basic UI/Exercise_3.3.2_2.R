library(shiny)

ui <- fluidPage(
  dataTableOutput("table")
)
server <- function(input, output, session) {
  output$table <- renderDataTable(mtcars, options = list(pageLength = 10,
                                                         searching = FALSE,
                                                         ordering = FALSE))
}

shinyApp(ui, server)
