library(shiny)

ui <- fluidPage(
  sliderInput("date", "Select Date", min = as.Date("2020-09-16"), max = as.Date("2020-09-23"),
              value = as.Date("2020-09-17"))
)


server <- function(input, output, session) {
  
}

shinyApp(ui, server)
