# Make sure to Run App!
library(shiny)
library(plotly)
library(dplyr)

## Create some widgets/lists/etc up here and add them into interactive pages as
## sidebarPanels or something


bar_main <- mainPanel(
  plotlyOutput("total")
)

bar_side <- sidebarPanel(
  sliderInput(
    "yearvar",
    label = "Year",
    min = min(athlete_events$Year),
    max = max(athlete_events$Year),
    value = min(athlete_events$Year),
    sep = ""
  )
)

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
      HTML('<center><img src = "olympiclogo.jpg"><center>'),
      br(),
      
      # Overview of project
      paste("In this project, we delved into the history of the Olympics,",
            "looking into data such as the athlete's names, sex, age, height",
            "weight, the team they played for, which event they play for, etc.",
            "Questions that we looked into during this project were:"),
      br(),
      paste("Did age have a relationship with how successful they were in",
            "sports?"),
      br(),
      paste("Did gender have a relationship with how successful they were in", 
            "sports?"),
      br(),
      paste("Did any specific country showed more success than others?"),
      br(),
      paste("In the beginning, we were utilizing 3 datasets in order to figure",
            "out the answers to our questions however we ended with only using",
            "one in the final version of our project."),
      
      br(),
      br(),
      # Image
      HTML('<center><img src = "track.jpg"><center>'),
      br(),
      
      paste("The dataset we used contains all sorts of information ranging",
            "from the athlete's names and gender to which country they",
            "represented/played for and which event they participated in.",
            "This historical dataset included games from Athens 1896 to Rio",
            "2016. We found this dataset on Kaggle which can be found at this"),
      a(href = paste0("https://www.kaggle.com/heesoo37/
                      120-years-of-olympic-history-athletes-and-results?select
                      =athlete_events.csv"),
        "link"),

    ),

    ## 1st Interactive Page
    tabPanel(
      "1st Interactive Page",
      titlePanel(
        "Top 10 Team's Total Medals(Gold, Silver, Bronze) Through the Years"
      ),
      bar_main,
      bar_side
    ),

    ## 2nd Interactive Page
    tabPanel(
      "2nd Interactive Page"
    ),

    ## 3rd Interactive Page
    tabPanel(
      "3rd Interactive Page"
    ),

    ## Summary
    tabPanel(
      "Summary Takeaway"
    )
  )
)

