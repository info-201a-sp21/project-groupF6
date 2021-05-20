library("dplyr")

athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

aggregate_info <- function(df) {
  df %>%
    group_by(Team, NOC, Medal) %>%
    filter(Medal != "NA") %>%
    mutate(Total_Medals = 1) %>%
    summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE, .groups = "keep")) %>%
    arrange(-Total_Medals)
}
test <- function(df) {
  df %>%
  group_by(Team, NOC, Medal) %>%
    filter(Medal != "NA") %>%
    mutate(Total_Medals = 1) %>%
    summarise(Total_Medals = sum(Total_Medals, na.rm = TRUE), Team, NOC,  Medal) %>%
    arrange(-Total_Medals)
}
