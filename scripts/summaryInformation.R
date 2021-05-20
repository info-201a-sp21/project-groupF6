library(dplyr)
athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

get_summary_info <- function(dataset) {
  summary <- list()
  summary$length <- length(dataset)
  summary$num_events <- length(unique(dataset$Sport))
  summary$num_teams <- length(unique(dataset$NOC))
  summary$gold_winners <- dataset %>%
    filter(Medal == "Gold") %>%
    mutate(freq = 1) %>%
    group_by(NOC) %>%
    summarize(gold_medals = sum(freq, na.rm = FALSE)) %>%
    arrange(desc(gold_medals)) %>%
    top_n(5, gold_medals)
  summary$oldest_data <- min(dataset$Year, na.rm = FALSE)
  summary$newest_data <- max(dataset$Year, na.rm = FALSE)
  return(summary)
}

get_summary_info(athlete_events)





