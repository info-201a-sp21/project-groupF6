#plot 2
athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)

library("dplyr")
library("ggplot2")
library("leaflet")
library("plotly")
filtered_athletevents <- na.omit(athlete_events) 

filter_age_into_years <- filtered_athletevents %>% 
  mutate(Age = case_when(Age >= 60  & Age <= 69 ~ '60+',
    Age >= 50  & Age <= 59 ~ '50s',
      Age >= 40  & Age <= 49 ~ '40s',
      Age >= 30  & Age <= 39 ~ '30s',
      Age >= 20  & Age <= 29 ~ '20s',
      Age >= 10  & Age <= 19 ~ '10s'))

age_versus_medal <- ggplot(filter_age_into_years, aes(x = Age, fill = Medal)) +
  geom_bar(width = 1) +
  ggtitle("Age Versus Medal Earned") +
  scale_color_brewer(palette = "Set3") +
  coord_flip()



