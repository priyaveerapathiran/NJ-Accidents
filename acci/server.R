function(input, output) {
  
  output$year <- renderPlot(
    accidents%>%
      filter(Year == input$Year)%>%
      group_by(Month)%>%
      summarise(count_by_day = n())%>%
      ggplot(aes(Month, count_by_day))+
      geom_line(group = 1, color = 'red')+
      geom_point(color = 'red')+
      ggtitle('Number of Accidents by Month')
    
  )
  
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

  output$distplot2 <- renderPlot(
    accidents%>%
      filter(Year == input$Year, Month == input$Month)%>%
      group_by(Crash.Day.Of.Week)%>%
      summarise(accidents_by_week = n())%>%
      ggplot(aes(Crash.Day.Of.Week, accidents_by_week))+
      geom_line(group = 1, color = 'red')+
      geom_point(color = 'red')+
      ggtitle('Accidents vs Weekday')
    
  )
  
  

}
