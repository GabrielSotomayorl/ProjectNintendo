library(shiny)
library(ggplot2)
library(plotly)


shinyServer(
    
    function(input, output) {
        
        base <- read.csv("basenintendo.csv")
        base$CONSOLE<- as.character(base$CONSOLE)
        base$GAME<- as.character(base$GAME)
        
        
        output$console <- renderUI({
            selectInput("console", "Choose a console:", as.list(unique(base$CONSOLE)), 
                        selected = levels(base$CONSOLE)[1] ) 
        })
        
        output$text1 <- renderText({
            paste("10 Most Selled Games: ", input$console)
        })
        
        
        output$distPlot <- renderPlotly({
            dt <- base[base$CONSOLE == input$console, ]

            ggplotly(ggplot(dt, aes(x= reorder(GAME, -SALES), y=SALES/1000000)) + 
                         geom_bar(stat = "identity",fill="#ff0000",alpha=.8, width=.7) + ylab("Sales (millions)")+
                         xlab("Games")+
                         theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)))
            
            
        })
        
    })
