#' xxx
#'
#' @param xx xxx
#' @return xxx

#' @keywords xxx
#' @examples
#' fill
#' @export
add_axis_icons <- function(breaks,labels,country_icons,logo_icons,width,...){

  markdown_labels <-
    paste0(labels,"<br>","<img src='",
           file.path(path.package("ggoxford"),"extdata/outlet_logos",logo_icons),".png",
           "' width = '",width,"' /><br><img src='",
           file.path(path.package("ggoxford"),"extdata/flags",country_icons),".png",
           "' width='",width,"' />")

  list(
    scale_x_discrete(breaks = breaks,labels = markdown_labels,...),
    theme(axis.text.x = element_markdown(lineheight = 2.5,
                                         face = "bold"))
  )
}


#' Add X-Axis flags to ggplots
#'
#' @param breaks x axis breaks
#' @param labels vector of labels to depict
#' @param country_icons country for which flag to depict, in capital letter ISO-3 format (e.g. DEU for Germany)
#' @param width width of the flag, defaults to 50
#' @param lineheight height of the axis label line
#' @param fontface Font Face for Labels, defaults to "bold"
#' @return adds x axis flags to ggplot
#' @references Flags are under CC-BY licence and are obtained from: https://github.com/eosrei/emojione-color-font
#' @note You must not call a ggplot theme after the call of geom_axis_flags, otherwise the theme parameter necessary for flag rendering will be overwritten.
#' @examples
#' options(tidyverse.quiet = TRUE)
#' library(tidyverse)
#' library(ggoxford)
#' library(ggtext)

#' wpop2013 <-
#'   tidyr::population %>%
#'   filter(year == 2013) %>%
#'   filter(population > 1e6) %>%
#'   mutate(iso3 = countrycode::countrycode(country,
#'                                          origin = "country.name.en",
#'                                          destination = "iso3c")
#'   ) %>%
#'   slice(1:10)

#' head(wpop2013,10)

#' ggplot(data = wpop2013 ,
#'        aes(x = iso3, y = population)) +
#'   geom_bar(stat = "identity") +
#'   theme_minimal() +
#'   geom_axis_flags(breaks = wpop2013$iso3,
#'                    labels = wpop2013$country,
#'                    country_icons = wpop2013$iso3,
#'                    width = 30,
#'                    lineheight = 2,
#'                    fontface = "bold"
#'   )
#'
#' @export
geom_axis_flags <- function(breaks,labels,country_icons,width = 50,lineheight = 3,fontface = "bold",...){

  markdown_labels <-
    paste0(labels,"\n<br>","<img src='",
           file.path(path.package("ggoxford"),"extdata/flags",country_icons),".png",
           "' width='",width,"' />")

  list(
    scale_x_discrete(breaks = breaks,labels = markdown_labels,...),
    theme(axis.text.x = ggtext::element_markdown(lineheight = lineheight,
                                         face = fontface))
  )
}
