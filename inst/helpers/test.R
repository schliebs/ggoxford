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
  )

head(wpop2013,10)

ggplot(data = wpop2013 %>%  slice(1:10),
       aes(x = population, y = iso3)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  geom_axis_flags(breaks = wpop2013$iso3,
                  labels = wpop2013$country,
                  country_icons = wpop2013$iso3,
                  axis = "y",
                  icons_only = T,
                  width = 30,
                  lineheight = 2,
                  fontface = "bold"
  )
