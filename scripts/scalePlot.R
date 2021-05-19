#plot 1
play_by_play <- read.csv("./data/NFLPlaybyPlay20092018.csv", stringsAsFactors = FALSE)

library("dplyr")
library("ggplot2")
library("leaflet")
library("plotly")

#yardline 100 vs defeated team


plot <- ggplot(data = play_by_play) +
  geom_(mapping = aes(x = num_killed, y = num_injured, color = state)) +
  ggtitle("Deaths and Injuries due to Shootings")


##you must describe why you included the chart (e.g., what it attempts to seeks to express), 
##and what information it reveals