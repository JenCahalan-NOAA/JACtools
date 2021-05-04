# TODO: Add comment
# 
# Author: jennifer.cahalan
###############################################################################
#' An Alaska Map Function
#'
#' This function creates a base map of Alaska.
#' @keywords AK map
#' @export
#' @examples
#' AKMap_fxn()

AKMap_fxn <- function(){
theme_set(theme_bw())
world2 <- sf::st_as_sf(maps::map('world2', plot = FALSE, fill = TRUE))

AK_cropped <- sf::st_crop(world2, xmin = 170, xmax = 230,
		ymin = 50, ymax = 67)

(ggAlaska <- ggplot2::ggplot(data = AK_cropped) +
			geom_sf(aes(fill = ID), size=0.05) +
			scale_fill_manual(values=c('grey20','grey40','grey80')) +
			theme(legend.position = "none",  
					panel.grid.minor = element_line(colour = "grey50")
			)
			+ scale_x_continuous(minor_breaks = seq(170, 230, 1))
			+ guides(fill = guide_legend(legend.position = "none"))
			) 
}
