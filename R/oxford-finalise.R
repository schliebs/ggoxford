
oii_logo <- ("logos/oii.png")
ox_logo <- ("logos/ox_logo_rect.png")
shared_logo <- ("logos/shared_logo.png")


save_plot <- function (plot_grid, width, height, save_filepath,dpi,scale) {
  grid::grid.draw(plot_grid)
  #save it
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid,
                  device = cairo_pdf,
                  width=(width/72), height=(height/72),  bg="white",dpi = dpi,scale = scale)
}


#' Arrange alignment and save BBC ggplot chart
#'
#' Running this function will save your plot with the correct guidelines for publication for a BBC News graphic.
#' It will left align your title, subtitle and source, add the BBC blocks at the bottom right and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your side
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'  which needs to be a PNG file - defaults to BBC blocks image that sits within the data folder of your package
#' @return (Invisibly) an updated ggplot object.

#' @keywords finalise_plot
#' @examples
#' finalise_plot(plot_name = myplot,
#' source = "The source for my data",
#' save_filepath = "filename_that_my_plot_should_be_saved_to-nc.png",
#' width_pixels = 640,
#' height_pixels = 450,
#' logo_image_path = "logo_image_filepath.png"
#' )
#'
#' @export
oii_finalise_plot <- function(plot_name,
                              source_name,
                              save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                              height_footer = 0.075,
                              width_pixels=640,
                              height_pixels=450,
                              dpi = 1000,
                              scale = 1,
                              #logo_image_path1 = file.path(system.file("data", package = 'bbplot'),"placeholder.png"),
                              logo_image_path1 = shared_logo,
                              footer_start = 0.80,
                              upper = 1) {

  footer <- create_oii_footer(source_name, logo_image_path1,footer_start)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))

  logo_height <- height_footer
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,#padding = unit(0.5,"line"),
                                 heights = c(upper, logo_height/(height_pixels/(logo_height*10000))))
  ## print(paste("Saving to", save_filepath))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath,dpi = dpi,scale = scale)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}
