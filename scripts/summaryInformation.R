
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




