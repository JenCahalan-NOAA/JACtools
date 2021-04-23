
###############################################################################
#' A Haversine Distance Function
#'
#' This function computes the great circle distance between two points (long, lat). 
#' Computations default to kilometers (for the WGS84 ellipsoid). This code was 
#'   adapted from https://en.wikipedia.org/wiki/Great-circle_distance;  
#'   https://en.wikipedia.org/wiki/Haversine_formula;  http://www.movable-type.co.uk/scripts/latlong.html  
#' In addition, see in the geosphere package  distm(p1, p2, fun = distVincentyEllipsoid) and distHaversine()
#' @param long1 longitude for first point
#' @param long2 longitude for second point
#' @param lat1 latitude for first point
#' @param lat2 latitude for first point
#' @param radius the radius of the earth; units of computed distance will be the same as the units of R. Dafaults to 6371 kilometers.
#' @keywords distance, haversign
#' @export
#' @examples
#' hav_dist(0,0,45,45)
#' distHaversine(c(0,0), c(45,45))/1000

hav_dist <- function(long1, lat1, long2, lat2, radius=6371) {
	R <- radius # kilometers (for the WGS84 ellipsoid)
	
	# convert to radians
	lat1r <- lat1*pi/180
	
	lat2r <- lat2*pi/180
	
	diff.long <- (long2 - long1)*pi/180
	diff.lat <- (lat2 - lat1)*pi/180
	a <- sin(diff.lat/2)^2 + cos(lat1r) * cos(lat2r) * sin(diff.long/2)^2
	b <- atan( (sqrt(a))/((sqrt(1-a)))  ) ## not allowing h > 1 (see http://www.movable-type.co.uk/scripts/latlong.htm)
	d = 2* R * b
	return(d)
}
