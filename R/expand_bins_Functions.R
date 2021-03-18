#' Expand binned frequency data to one record per item
#'
#' This function takes binned data and expands it to one record per item, returning an expanded data frame.
#' For large data sets, this may take a while
#'
#' @param x A dataframe with one column called 'FREQUENCY'. Each row of the dataframe is copied 'FREQUENCY' times.
#' @return a dataframe with sum(FREQUENCY) number of records
#' @keywords binned, frequency, length
#' @export
#' @examples
#' Covariate <- c('Red', 'Blue','Red','Red','Blue','Blue')
#' FREQUENCY <-  c(5,4,5,3,4,1)
#' ID <- c(1,2,3,4,5,6)
#' 
#' test.dat <- data.frame(ID,Covariate,FREQUENCY)
#' for(i in 1:length(test.dat$ID)) { 
#'	 if(i==1) expanded.test.dat <- expand_binned(test.dat)
#'	 if (i>1) expanded.test.dat <- rbind(expanded.test.dat, expand_binned(test.dat))
#' }
#' test.dat
#' expanded.test.dat

expand_binned <- function(x){
	x[rep(i, each = x$FREQUENCY[i]), ]
}



