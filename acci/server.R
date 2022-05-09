library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
function(input, output) {
  
  output$distplot1 <- renderPlot(
    accidents%>%
      filter(Year == input$Year & Month == input$Month)%>%
      group_by(Day)%>%
      summarise(count_by_day = n())%>%
      ggplot(aes(Day, count_by_day))+
      geom_line(group = 1, color = 'red')+
      geom_point(color = 'red')+
      ggtitle('Number of Accidents by Day')
      
   )

  
 
  

}
