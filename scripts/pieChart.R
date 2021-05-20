#plot 3
athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

library("dplyr")
library("ggplot2")
library("leaflet")
library("plotly")
filtered_athletevents <- na.omit(athlete_events)

sex_versus_medal <- ggplot(data = filtered_athletevents, aes(x = "" , y = "" , fill = Medal)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) + 
  facet_grid(.~Sex) +
  labs(x = NULL,
       y = NULL,
       title = "Sex Versus Medal Earned")

