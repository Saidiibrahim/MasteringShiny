library(shiny)
ui <- selectInput(
  "breed",
  "Select your favorite animal breed:",
  choices =
    list(`dogs` = list('German Shepherd', 'Bulldog', 'Labrador Retriever'),
         `cats` = list('Persian cat', 'Bengal cat', 'Siamese Cat'))
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
