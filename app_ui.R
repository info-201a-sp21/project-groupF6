library(shiny)

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
      "Introduction"
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