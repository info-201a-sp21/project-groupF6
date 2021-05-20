athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

# This table is grouped by Team and it includes the teams who have at least won
# one medal. "Total_medal" counts the top 10 team's total medals whether it be
# Gold, Silver, or Bronze in order from most to least.

aggregate_info <- function(df) {
  df %>%
    group_by(Team) %>%
    filter(Medal != "NA") %>%
    mutate(Total_Medals = 1) %>%
    summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE)) %>%
    arrange(-Total_Medals) %>%
    head(10)
}
