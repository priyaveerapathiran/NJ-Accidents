fluidPage(
  titlePanel("NJ Cases"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput(inputId = "Year",
                     label = "Year",
                     choices = sort(unique(accidents$Year))),
      
      selectizeInput(inputId = "Month",
                     label = "Month",
                     choices = sort(unique(accidents$Month))),
      
      selectizeInput(inputId = "Crash.Day.Of.Week",
                     label = "Crash.Day.Of.Week",
                     choices = sort(unique(accidents$Crash.Day.Of.Week)))
       
    ),
mainPanel(
  tabsetPanel(
    tabPanel('plot1', plotOutput('year')),
    tabPanel('plot2', plotOutput('distplot1')),
    tabPanel('plot3', plotOutput('distplot2'))
    
   ))
)
)