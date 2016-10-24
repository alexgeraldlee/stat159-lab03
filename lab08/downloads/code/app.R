advertising <- read.csv("Advertising.csv")


library(shiny)

ui <- fluidPage(
  selectInput(inputId = "budget_type",
              label = "Commercial Type",
              choices = c("TV", "Radio", "Newspaper"),
              selected = "TV"),
  plotOutput("scatter")
)

server <- function(input, output) {
  output$scatter <- renderPlot({
    title <- paste0(input$budget_type, " Budget vs Sales")
    xlabel <- paste0(input$budget_type, " Budget (in Thousands of Dollars)")
    ylabel <- "Sales (in Thousands of Units)"
    plot(advertising[,input$budget_type], advertising$Sales, 
         main = title, xlab = xlabel, ylab = ylabel)
  })
  

}

shinyApp(ui = ui, server = server)
