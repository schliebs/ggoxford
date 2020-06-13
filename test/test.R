library(tidyverse)
library(ggoxford)
library(ggtext)

wpop2013 <-
  tidyr::population %>%
  filter(year == 2013) %>%
  filter(population > 1e6) %>%
  mutate(iso3 = countrycode::countrycode(country,
                                         origin = "country.name.en",
                                         destination = "iso3c")
  ) %>%
  slice(1:10)

head(wpop2013,10)

ggplot(data = wpop2013 ,
       aes(x = iso3, y = population)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  geom_axis_flags2(breaks = wpop2013$iso3,
                  labels = wpop2013$country,
                  country_icons = wpop2013$iso3,
                  width = 30,
                  lineheight = 2,
                  fontface = "bold"
                  )

wpop2013$country %>% tail(10) %>% purrr::map_chr(~paste(strwrap(.x,15), collapse="\n"))

s = "Lorem ipsum... you know the routine"
paste(strwrap(s,5), collapse="\n")
strwrap(s,5)
