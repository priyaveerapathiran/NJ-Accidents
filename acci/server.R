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
  
  output$hours <- renderPlot(
    accidents%>%
    group_by(hours)%>%
    summarise(total_accidents = n())%>%
    ggplot(aes(x = hours, y = total_accidents))+
    geom_bar(stat = 'identity')
  )

}
