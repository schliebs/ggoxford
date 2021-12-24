#Left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

create_oii_footer <- function (source_name, logo_image_path1,footer_start,fontsize) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source_name,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=fontsize,
                                                                                fontfamily = "Roboto",
                                                                                col = oxblue
                                                                               )),
                           grid::rasterGrob(png::readPNG(logo_image_path1), x = footer_start))
  return(footer)

}
