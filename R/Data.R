###############################################################################
#' A base map of Alaska 
#'
#' This RData file contains a base map of Alaska created using ggplot2
#'    based on downlaod of a google map
#' Google's Terms of Service: <https://cloud.google.com/maps-platform/terms/>.
#' Please cite ggmap if you use it! See citation("ggmap") for details.
#'
#'   The base map was generated using the following code:
#'
#' AK.base <- get_map(location = c(lon=-150,lat=60),
#'        zoom = 3, scale = "auto",
#'        maptype = c("terrain"),
#'        messaging = FALSE, urlonly = FALSE,
#'        filename = "ggmapTemp", crop = FALSE,
#'        color = c("color"),
#'        source = c("google")
#' )
#'
#' The dataframe, locations.dat, has the latitude, longitude, and a site_type (A or B)
#'    for 100 randomly generated locations in Alaska. This dataframe is used in the example.
#'
#' @docType data
#' 
#' @usage ggmap::ggmap(AK.base)
#'
#' @format A ggplot object (map) 
#'
#' @keywords Alaska map
#' @examples ggmap::ggmap(AK.base)
#'
#' (ggmap::ggmap(AK.base.map) + ggplot2::geom_point(data=locations.dat, 
#'					aes(y=LATITUDE, x=(LONGITUDE), color=site_type, shape=site_type), size=3.0)
#'			+ ggplot2::scale_shape_manual('Site Type', values=c(16,17), guide=FALSE)
#'			+ ggplot2::scale_color_manual('Site Type',values=c('purple4','yellow'))
#'			
#'			+ labs(x='', y='',title='Site Locations', sep='')
#'			
#'			+ ggplot2::scale_x_continuous(limits = c(-190,-130), expand = c(0, 0)) 
#'			+ ggplot2::scale_y_continuous(limits = c(48,65), expand = c(0, 0))
#'			
#'			+ ggplot2::theme_bw()
#'			+ ggplot2::theme(legend.position="bottom")
#'			)
#'

"AK.base.map"
"locations.dat"