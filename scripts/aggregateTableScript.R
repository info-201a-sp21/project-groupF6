library("dplyr")

athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

# This table is group by Team and it includes the teams who have at least won 
# one medal. The total medal counts the teams total medals whether it be Gold,
# Silver, or Bronze in order from most to least. 

aggregate_info <- function(df) {
  df %>%
    group_by(Team) %>%
    filter(Medal != "NA") %>%
    mutate(Total_Medals = 1) %>%
<<<<<<< HEAD
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
=======
    summarize(Total_Medals = sum(Total_Medals, na.rm = TRUE)) %>%
    arrange(-Total_Medals) %>% 
    head(10)
>>>>>>> c2ece46ccee089c5ed9bc54f0335b22566bc0985
}

