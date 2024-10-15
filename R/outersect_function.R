#' Find the anti-intersection of two vectors
#'
#' This function returns the values that are not in both vectors. \cr
#' 
#' @param x A vector.
#' @param y A vector.
#' @keywords anti intersection
#' @export
#' @examples
#' color.dat <- c(rep('A', 5),rep('B', 5))
#' y.dat <- c(rnorm(5,2, 2), rnorm(5,5,5))
#' x.dat <- c(rnorm(5,20, 2), rnorm(5,50,5))
#' df1 <- data.frame(color.dat,x.dat)
#' df2 <- data.frame(color.dat,y.dat)
#' outersect(names(df1),names(df2))

outersect.fxn <- function(x, y, ...) {
	big.vec <- c(x, y, ...)
	duplicates <- big.vec[duplicated(big.vec)]
	setdiff(big.vec, unique(duplicates))
}