# Make sure to Run App!
library(shiny)
library(plotly)

athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

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
sex_select <- sidebarPanel(
  radioButtons(
    inputId = "selectedSex",
    label = "Sex:",
    choices = list("Female" = "F", "Male" = "M"),
    selected = 1, 2
  )
)
bar_second <- mainPanel(
  plotlyOutput(
    outputId = "barplot2"
  )
)
age_bar <- mainPanel(
  plotlyOutput("bar")
)
age_select <- sidebarPanel(
  selectInput(
    inputId = "selectedAge",
    label = "Select Age Group",
    choices = list(
      "Less than 18 years",
      "18-24 years",
      "25-35 years",
      "More than 35 years"
    )
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
    tabPanel(
      "Introduction",
      h3("Going Through the Olympics Data", align = "center"),
      br(),
      # Image
      HTML('<center><img src = "olympiclogo.jpg"><center>'),
      br(),

      # Overview of project
      paste(
        "In this project, we delved into the history of the Olympics,",
        "looking into data such as the athlete's names, sex, age, height",
        "weight, the team they played for, which event they play for, etc.",
        "Questions that we looked into during this project were:"
      ),
      br(),
      h4(
        paste(
          "Did age have a relationship with how successful they were",
          "in sports?"
        ),
        br(),
        paste(
          "Did gender have a relationship with how successful they",
          "were in sports?"
        ),
        br(),
        paste("Did any specific country showed more success than others?")
      ),
      paste(
        "In the beginning, we were utilizing 3 datasets in order to figure",
        "out the answers to our questions however we ended with only using",
        "one in the final version of our project."
      ),
      br(),
      br(),
      # Image
      HTML('<center><img src = "track.jpg"><center>'),
      br(),
      paste(
        "The dataset we used contains all sorts of information ranging",
        "from the athlete's names and gender to which country they",
        "represented/played for and which event they participated in.",
        "This historical dataset included games from Athens 1896 to Rio",
        "2016."
      ),
      br(),
      paste("We found this dataset on Kaggle which can be found at this"),
      a(
        href = ("https://bit.ly/3gkv9LZ"),
        "link"
      ),
    ),

    ## 1st Interactive Page
    tabPanel(
      "1st Interactive Page",
      titlePanel(
        "Top 10 Team's Total Medals (Gold, Silver, Bronze) Through the Years"
      ),
      bar_main,
      bar_side
    ),

    ## 2nd Interactive Page
    tabPanel(
      "2nd Interactive Page",
      titlePanel(
        "Relationship Between Sex and Medal Earned"
      ),
      sex_select,
      bar_second
    ),


  ## 3rd Interactive Page
  tabPanel(
    "3rd Interactive Page",
    titlePanel(
      "Total Medal Count Across Age Groups"
    ),
    age_select,
    age_bar
  ),

  ## Summary
  tabPanel(
    "Summary Takeaway",
    h3("Total Medals"),
    h4("United States"),
    paste("Throughout the years, United States has demonstrated their",
          "dominance in the Olympics. Ever since 1904, United States has",
          "maintained their lead in total medals including gold, silver, and",
          "bronze medals over any other country. In 2016, United States were",
          "able to acquire just over 5000 total medals"),
    h4("Soviet Union"),
    paste("The Soviet Union didn't even make it onto the top 10 team's total",
          "medals list until 1960 racking in slightly above 500 total medals",
          "while United States already had well above 1500 total medals.",
          "But as the years went by, Soviet Union quickly rose through the",
          "list and came close to the United States in 1982 with a staggering",
          "2000 total medals, 1500 more than what they had just 22 years ago.",
          "Their pace quickly fell off after that and they ended up only",
          "having around 2500 total medals in 2016, half of what the United",
          "States have."),
    h4("Germany"),
    paste("Like the United States, Germany has been in the top 10 total medals",
          "list since 1896. Unlike the Soviet Union who had a quick rise in a",
          "short period of time, Germany has been keeping a steady pace with",
          "the amount of medals they have won. Averaging around 16 medals a",
          "year, Germany came in third place with the most amount of total",
          "medals in 2016 with araound 2000 medals."),
    h3("Takeaway #2"),
    h3("Takeaway #3"),
  )
)
)
