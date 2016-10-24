advertising <- read.csv("Advertising.csv")

# 01-kmeans-app

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

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
