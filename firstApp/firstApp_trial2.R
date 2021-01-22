library(shiny)
library(ggplot2)

# Code to generate plot
freqpoly <- function(x1, x2, binwidth = 0.1, xlim = c(-3, 3)) {
  df <- data.frame(
    x = c(x1, x2),
    g = c(rep("x1", length(x1)), rep("x2", length(x2)))
  )
  
  ggplot(df, aes(x, colour = g)) +
    geom_freqpoly(binwidth = binwidth, size = 1) +
    coord_cartesian(xlim = xlim)
}

t_test <- function(x1, x2) {
  test <- t.test(x1, x2)
  
  sprintf(
    "p value: %0.3f\n[%0.2f, %0.2f]",
    test$p.value, test$conf.int[1], test$conf.int[2]
  )
}

ui <- navbarPage("App Title",
        theme = shinythemes::shinytheme("flatly"),
        tabPanel("Plot",
          sidebarLayout(
            sidebarPanel(
              numericInput("m", "Number of samples:", 2, min = 1, max = 100),
            ),
            mainPanel(
              plotOutput("hist")
            )
          )),
        tabPanel("Summary",
          sidebarLayout(
            sidebarPanel(
              numericInput("lambda1", label = "lambda1", value = 3),
              numericInput("lambda2", label = "lambda2", value = 5),
              numericInput("n", label = "n", value = 1e4, min = 0)
            ),
            mainPanel(
              plotOutput("hist2")
            )
          )),
        tabPanel("About")
)
  
server <- function(input, output, session) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  }, res = 96)
  
  x1 <- reactive(rpois(input$n, input$lambda1))
  x2 <- reactive(rpois(input$n, input$lambda2))
  output$hist2 <- renderPlot({
    freqpoly(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  }, res = 96)
}

shinyApp(ui, server)
  