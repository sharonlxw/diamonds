library(shiny)
library(ggplot2)

# User interface

ui <- fluidPage(
  titlePanel("Diamonds Data", windowTitle = "Diamonds"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"), 
      textInput(inputId = "title",    ## this is a GUI
                label = "Chart Title", 
                value = ""),
      selectInput(inputId = "pos",  ## this is another GUI
                  label = "Position",
                  choices = list("stack", "dodge"), ## have to be small letter because ggplot will use them as code
                  selected = "stack")
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Server

server <- function(input, output){
  
  output$plot = renderPlot(
    ggplot(diamonds, aes(x = cut, fill = clarity)) +
      geom_bar(position = input$pos) +
      ggtitle(input$title)
  )
}

# run the app
shinyApp(ui, server)
