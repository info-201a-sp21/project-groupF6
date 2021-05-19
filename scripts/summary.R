rm(list = ls())
library(dplyr)
athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

# summary function - must compute at least five different values from
# your data that you believe are pertinent to share
get_summary_info <- function(dataset) {
  summary <- list()
  summary$length <- length(dataset)
  summary$events <- unique(dataset$Sport)
  summary$teams <- unique(dataset$NOC)
  summary$gold_winners <- dataset %>%
    filter(Medal == "Gold") %>%
    pull(NOC)
  summary$oldest_data <- min(dataset$Year, na.rm = FALSE)
  summary$newest_data <- max(dataset$Year, na.rm = FALSE)
  return(summary)
}




