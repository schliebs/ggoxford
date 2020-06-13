library(tidyverse)
library(rsvg)

# lf <- list.files(path = "rawdata/emojione-svg_raw/",
#                  pattern = glob2rx("*.svg"),
#                  full.names = FALSE)

which = c("GBR","FRA","ESP","DEU","CHN","RUS","IRN","TUR")

names <- countrycode::countryname_dict %>% pull(country.name.en) %>% unique()
iso3 <- countrycode::countrycode(names,origin = "country.name.en",destination = "iso3c")
iso3 <- iso3 %>% unique()
iso3


iso2unicode <- function(iso){

  unic <- countrycode::countrycode(iso, origin = 'iso3c',
                           destination = 'unicode.symbol')

  file <- stringi::stri_escape_unicode(unic) %>%
    str_remove_all("U000") %>% str_split("\\\\")%>%.[[1]] %>%
    paste0(.,collapse = "-") %>% str_remove("-") %>% paste0(.,".svg")

  path <- paste0("rawdata/emojione-svg_raw/",file)
  path
}

iso2unicode("GBR")

width = 3840/16

which = c("GBR","DEU","XXX","SEN","UKR")
which = iso3

purrr::map(.x = which,
           .f = possibly({
               function(x){
                 print(x)
               bitmap <- rsvg(iso2unicode(x),
                              width = width)
               png::writePNG(bitmap,
                             paste0("inst/extdata/flags/",x,".png"),
                             dpi = 144)
               }},otherwise = NULL)
)
