# TODO: Add comment
# 
# Author: jennifer.cahalan
###############################################################################
#' An Alaska Map Function
#'
#' This function creates a base map of Alaska, showing Canadian and Russian shorelines. 
#'   This function uses the 'world2' dataset included in the sf package to generate a 
#'   map of Alaska inclusive of the Canaian and Russian shorelines.  \cr
#' @details
#' Note that the warning message:
#'     \emph{Warning message: In st_centroid.sf(nmfs_areas_shapefile): st_centroid assumes attributes are constant over geometries of x}  \cr
#'     Indicates that the lables are not located exactly on the centroid for the NMFS Reporting Area (in addition some were intentially moved).  \cr
#' Additionally note the message \emph{"although coordinates are longitude/latitude, st_intersection assumes that they are planar"}
#'     indicates that spatial coordinates are on a flat space ({\eqn{R^2}}, not an ellipsoid or sphere); {\eqn{R^2}} is not in use. \cr  
#' 
#' There are 5 maps contained in the JACtools package: \itemize{\item 2 Mercator with NMFS Reporting Areas (with and without labels: AK_MercatorL_fxn, AK_Mercator_fxn)
#'                                                     \item 2 Robinson with NMFS Reporting Areas (with and without labels: AK_RobinsonL_fxn, AK_Robinson_fxn)
#'                                                     \item 1 Mercator without NMFS Reporting Areas (AKMap_fxn)}
#' (https://www.icsm.gov.au/education/fundamentals-mapping/projections/commonly-used-map-projections)
#' 
#' @keywords AK map
#' @export
#' @examples
#' AKMap_fxn()

AKMap_fxn <- function(){
theme_set(theme_bw())
sf::sf_use_s2(FALSE)
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
