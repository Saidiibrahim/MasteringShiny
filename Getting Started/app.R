library(shiny)

# We’re going to make a very simple app that shows you all the built-in data 
#frames included in the datasets package.
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
 
  output$table <- renderTable({
    dataset()
  })
}

shinyApp(ui, server)

