# Make sure to Run App!
library(shiny)
source("scripts/summaryInformation.R")
source("scripts/aggregateTableScript.R")
source("scripts/barChart.R")
source("scripts/pieChart.R")
source("scripts/scalePlot.R")

athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  vars <- reactive({
    req(input$yearvar)
    df <- athlete_events %>%
      group_by(Team, Year) %>%
      filter(Medal != "NA") %>%
      mutate(Total_Medals = 1) %>%
      summarize(
        Total_Medals = sum(Total_Medals, na.rm = TRUE), .groups = "keep"
      ) %>%
      filter(Year <= input$yearvar) %>%
      group_by(Team) %>%
      summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE)) %>%
      arrange(-Total_Medals) %>%
      head(10)
  })

  output$total <- renderPlotly({
    plot <- plot_ly(
      data = vars(),
      x = ~Team,
      y = ~Total_Medals,
      color = "red",
      opacity = 0.85,
      type = "bar"
    ) %>%
      layout(
        title = paste0("Through ", input$yearvar),
        xaxis = list(title = "Team"),
        yaxis = list(title = "Total Medals")
      )
    return(plot)
  })
  
  by_age <- athlete_events %>%
    filter(Age != "NA") %>%
    mutate(Age_Group = case_when(
      Age < 18 ~ "Less than 18 years",
      Age >= 18 & Age <= 24 ~ "18-24 years",
      Age >= 25 & Age <= 35 ~ "25-35 years",
      Age > 35 ~ "More than 35 years"))
  
  age_group_summary <- reactive({
    req(input$selected_age) 
    df <- by_age %>%
      group_by(Age_Group) %>%
      filter(Medal != "NA") %>%
      mutate(Total_Medals = 1) %>%
      filter(Age_Group == input$selected_age) %>%
      summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE), 
                Age = Age)
  })
  
  output$bar <- renderPlotly({
    barplot <- plot_ly(
      data = age_group_summary(),
      x = ~Age,
      y = ~Total_Medals,
      type = "bar"
    ) %>%
      layout(
        title = paste0("Total Medals by Age Group (", input$selected_age, ")"),
        xaxis = list(title = "Age in Years"),
        yaxis = list(title = "Total Medals")
      )
    return(barplot)
  })
}
