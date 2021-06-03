# Make sure to Run App!
library(shiny)
library(dplyr)
source("scripts/summaryInformation.R")
source("scripts/aggregateTableScript.R")
source("scripts/barChart.R")
source("scripts/pieChart.R")
source("scripts/scalePlot.R")

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
  
  sex_vs_medal <- reactive({
    req(input$selectedSex) 
    df <- athlete_events %>%
      group_by(Sex, Medal) %>% 
      filter(Medal != "NA") %>%
      mutate(Total_Medals = 1) %>%
      filter(Sex == input$selectedSex) %>% 
      summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE),
                .groups = "keep")
  })
  output$barplot2 <- renderPlotly({
    boxplot2 <- plot_ly(
      data = sex_vs_medal(),
      x = ~Total_Medals,
      y = ~Medal,
      type = "scatter"
    ) %>%
      layout(
        title = paste0("Sex Versus Medal Earned"),
        xaxis = list(title = "Sex"),
        yaxis = list(title = "Medal Earned")
      )
    return(boxplot2)
  })
  
  by_age <- athlete_events %>%
    filter(Age != "NA") %>%
    mutate(Age_Group = case_when(
      Age < 18 ~ "Less than 18 years",
      Age >= 18 & Age <= 24 ~ "18-24 years",
      Age >= 25 & Age <= 35 ~ "25-35 years",
      Age > 35 ~ "More than 35 years"))
  
  age_group_summary <- reactive({
    req(input$selectedAge) 
    df <- by_age %>%
      group_by(Age_Group) %>%
      filter(Medal != "NA") %>%
      mutate(Total_Medals = 1) %>%
      filter(Age_Group == input$selectedAge) %>%
      summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE), 
                Age = Age, .groups = "keep")
  })
  
  output$bar <- renderPlotly({
    barplot <- plot_ly(
      data = age_group_summary(),
      x = ~Age,
      y = ~Total_Medals,
      type = "bar"
    ) %>%
      layout(
        title = paste0("Total Medals by Age Group (", input$selectedAge, ")"),
        xaxis = list(title = "Age in Years"),
        yaxis = list(title = "Total Medals")
      )
    return(barplot)
  })
}
