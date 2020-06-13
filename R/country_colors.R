#' xxx
#'
#' @param xx xxx
#' @return xxx

#' @keywords xxx
#' @examples
#' fill
#' @export
country_colors <- function(iso3){

  vec <- c(chn = "#ff5263",#"#ed4c5c",
           rus = "#428ac1",#"#0033A0",
           irn = "#83bf4f",#"#239f40",
           qat = "purple",
           gbr = "#133f75",#"#2a5e9e",#"grey",
           tur = "#b02020",#firebrick3",
           sda = "#006C35",
           ref = "grey",
           deu = "grey",
           fra = "grey",
           esp = "grey")

  return(vec[iso3] %>% as.character())
}
