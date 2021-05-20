#chart 1 - season vs team vs medal

library("dplyr")
library("ggplot2")
library("leaflet")
library("plotly")

athlete_events <- read.csv("data/athlete_events.csv", stringsAsFactors = FALSE)
filtered_athletevents <- na.omit(athlete_events) 


filter_age_weight_height <- filtered_athletevents %>% 
  mutate(Age = case_when(Age >= 60  & Age <= 69 ~ '60+',
                        Age >= 50  & Age <= 59 ~ '50s',
                         Age >= 40  & Age <= 49 ~ '40s',
                         Age >= 30  & Age <= 39 ~ '30s',
                         Age >= 20  & Age <= 29 ~ '20s',
                         Age >= 10  & Age <= 19 ~ '10s')) %>%
  mutate(Weight = case_when(Weight >= 170  & Weight <= 189 ~ '170+',
                            Weight >= 160  & Weight <= 169 ~ '160 - 169',
                            Weight >= 150  & Weight <= 159 ~ '150 - 159',
                            Weight >= 140  & Weight <= 149 ~ '140 - 149',
                            Weight >= 130  & Weight <= 139 ~ '130 - 139',
                            Weight >= 120  & Weight <= 129 ~ '120 - 129',
                            Weight >= 110  & Weight <= 119 ~ '110 - 119',
                            Weight >= 100  & Weight <= 109 ~ '100 - 109',
                            Weight >= 90  & Weight <= 99 ~ '90 - 99',
                            Weight >= 80  & Weight <= 89 ~ '80 - 89',
                            Weight >= 70  & Weight <= 79 ~ '70 - 79',
                            Weight >= 60  & Weight <= 69 ~ '60 - 69',
                            Weight >= 50  & Weight <= 59 ~ '50 - 59',
                            Weight >= 40  & Weight <= 49 ~ '40 - 49',
                            Weight >= 30  & Weight <= 39 ~ '30 - 39',
                            Weight >= 20  & Weight <= 29 ~ '20 - 29')) %>%
  mutate(Height = case_when(Height >= 220  & Height <= 229 ~ '220+',
                            Height >= 210  & Height <= 219 ~ '210 - 219',
                            Height >= 200  & Height <= 209 ~ '200 - 209',
                            Height >= 190  & Height <= 199 ~ '190 - 199',
                            Height >= 180  & Height <= 189 ~ '180 - 189',
                            Height >= 170  & Height <= 179 ~ '170 - 179',
                            Height >= 160  & Height <= 169 ~ '160 - 169',
                            Height >= 150  & Height <= 159 ~ '150 - 159',
                            Height >= 140  & Height <= 149 ~ '140 - 149',
                            Height >= 130  & Height <= 139 ~ '130 - 139'))

height_vs_weight <- ggplot(data = filter_age_weight_height) +
  geom_point(mapping = aes(x = Height, y = Weight, color = Age)) +
  ggtitle("Height versus Weight versus Age of Olympic Athletes ") +
  xlab("Height (cm)") + 
  ylab("Weight (kg)") +
  scale_color_brewer(palette = "Dark2")



