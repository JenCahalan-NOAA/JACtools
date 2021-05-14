# TODO: Add comment
# 
# Author: jennifer.cahalan
###############################################################################
#' A Function that subtracts a constant from a haul date. 
#'
#' This function subtracts a constant from a haul data (as.Date(format = ("%Y-%m-%d")). It would be useful if one wanted
#'     to create a dataframe where dates are lagged.
#' @param input.dat A dataframe that contains one column named 'HAUL_DATE'.
#' @param i a constant that will be subtracted from the Haul_Date
#' @keywords lag
#' @export
#' @examples
#'  HAUL_DATE <- as.Date(c("2019-10-13", "2019-09-10","2019-07-11", "2019-04-27", "2019-09-09", "2019-05-27", "2019-09-14", "2019-08-24", "2019-09-28", "2019-04-18"),
#'		           format = ("%Y-%m-%d"))
#' HAUL_NUMBER <- 1:10
#' obs.dat <- data.frame(cbind(HAUL_NUMBER, HAUL_DATE))
#' i <- 3
#' lag_day(obs.dat, i)
#'
#' for(i in -3:3) {
#'	if(i == -3) new.plot.dat <- lag.day(obs.dat, i) 
#'	if(i > -3) new.plot.dat <- rbind(new.plot.dat, lag.day(obs.dat, i) )
#'}

lag_day <- function(input.dat, i){
	new.dat <- input.dat
	new.dat$HAUL_DATE <- new.dat$HAUL_DATE - i 
        new.dat$HAUL_DATE <- as.Date(new.dat$HAUL_DATE,  format = ("%Y-%m-%d"))
	return(new.dat)	
}
