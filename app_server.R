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
}
