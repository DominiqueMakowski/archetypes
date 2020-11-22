library(timevis)
library(tidyverse)

data <- data.frame(
  content = c("Lion-man figurine",
              "Item two")) %>%
  mutate(start = lubridate::ymd("0000-01-01"),
         end = lubridate::ymd("0000-01-01"))

data$start <- data$start - lubridate::years(c(
  38000,
  37000
))

data$end <- data$start - lubridate::years(c(
  5000,
  1000
))

data$mean <- (data$end - data$start)/2

ggplot(data, aes(x=content, y=mean, group = 1)) +
  geom_pointrange(aes(ymin = start, ymax = end)) +
  geom_linerange(aes(ymin = start, ymax = end)) +
  # scale_y_date(breaks=scales::date_breaks(width = "1 month")) +
  coord_flip()





timeline <- timevis::timevis(data)
timeline

htmlwidgets::saveWidget(timeline, "religion_timeline.html", selfcontained = FALSE)
webshot::webshot("religion_timeline.html")
