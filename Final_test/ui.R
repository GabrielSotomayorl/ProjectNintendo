
library(shiny)
library(plotly)


shinyUI(fluidPage(
    
    titlePanel("Nintendo Console"),
    
    sidebarLayout(
        sidebarPanel(
            uiOutput("console")
        ),
        
        
        mainPanel(
            h3(textOutput("text1")),
            plotlyOutput("distPlot")
        )
    )
)
)