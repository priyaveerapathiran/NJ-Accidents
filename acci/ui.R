#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
accidents <- read_csv('accidents.csv')

case_count = sum(accidents$Case.Number)

# Define UI for application that draws a histogram


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
      
    
      
      
    ) 
),
    
mainPanel(
  plotOutput('distplot1')
        
      
      
   )
  


)