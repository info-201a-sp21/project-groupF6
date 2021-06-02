# Make sure to Run App!
library(shiny)
library(plotly)
library(dplyr)

## Create some widgets/lists/etc up here and add them into interactive pages as sidebarPanels or something

ui <- fluidPage(
  
  ## Custom CSS style
  includeCSS("style.css"),
  ## Title
  h1("Analysis of the Olympic History"),
  ## Authors
  h2("By Isaac Garibay-Zamudio, Veronica Mendoza, Hannah Pae, and Ryan Tran"),
  
  ## Creates multiple tabs
  tabsetPanel(
    ## Introduction Page
    tabPanel (
      "Introduction",
      h3("Going Through the Olympics Data"),
      
      br(),
      # Image
      HTML('<img src = "olympics.jpg">'),
      br(),
      
      # Overview of project
      paste("In this project, we delved into the history of the Olympics,",
            "looking into data such as the athlete's names, sex, age, height",
            "weight, the team they played for, which event they play for, etc.",
            "Questions that we looked into during this project were:",
            "Did age have a relationship with the amount of medals won,",
            "Question 2,",
            "Question 3."),
    ),
    
    ## 1st Interactive Page
    tabPanel (
      "1st Interactive Page"
    ),
    
    ## 2nd Interactive Page
    tabPanel (
      "2nd Interactive Page"
    ),
    
    ## 3rd Interactive Page
    tabPanel (
      "3rd Interactive Page"
    ),
    
    ## Summary
    tabPanel (
      "Summary Takeaway"
    )
  )
)

