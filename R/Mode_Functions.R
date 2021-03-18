#' Compute the Mode of numeric data
#'
#' This function returns the mode of a numeric vector(x).
#' @param x A vector of values for which the Mode(x) is computed. x must be a vector of numeric values, missing values are dropped from computations; for character data use Mode.alpha().
#' @return a numeric value, the mode of x
#' @keywords Mode
#' @export
#' @examples
#' x <- c(5,4,7,3,5,8,4,1,3,5,7,2,6,4,6,4,5,5,5,7,4,5,8,6,5)
#' Mode_numeric(x)
#'
Mode_numeric <- function(x){
	freq <- table(x[which(!is.na(x))])
	Mode_x <- as.numeric(names(freq)[which.max(freq)])
	return(Mode_x)
}

#' Compute the Mode of character data
#'
#' This function returns the mode of a vector(x).
#' @param x A vector of character values for which the Mode(x) is computed. x must be a vector of character values, missing values are dropped from computations; for numeric data use Mode.numeric().
#' @return a character value, the mode of x
#' @keywords Mode
#' @export
#' @examples
#' x <- c("a","a","b","c","a","c")
#' Mode_alpha(x)
#'
Mode_alpha <- function(x) {
	ux <- unique(x[which(!is.na(x))])
	ux[which.max(tabulate(match(x, ux)))]
} # 	Note this breaks down with continuous data .... hence with Beta dsn, rounded to two decimal points.
###############################################################################
#' Compute the NOT Mode of numeric data
#'
#' This function returns the value that is NOT the mode (anti-mode) of a numeric vector(x). Note this is only valid for vectors with two possible values
#' @param x A vector consisting of two values for which the Mode(x) is computed. x must be a vector of numeric values, missing values are dropped from computations; for character data use Mode.alpha().
#' @return a numeric value, the value that is not the mode of x
#' @keywords anti-Mode
#' @export
#' @examples
#' x <- c(5,4,5,4,5,5,4,4,5,5,4,5,4,4,5,4,5,5,5,4,4,5,5,4,5)
#' anti_Mode_numeric(x)
#'
anti_Mode_numeric <- function(x){
	freq <- table(x[which(!is.na(x))])
	Mode_x <- as.numeric(names(freq)[which.min(freq)])
	return(Mode_x)
}

#' Compute the NOT Mode of character data
#'
#' This function returns the anti-mode of a vector(x).
#' @param x A vector cinsiting of two character values for which the Mode(x) is computed. x must be a vector of character values, missing values are dropped from computations; for numeric data use Mode.numeric().
#' @return a character value, the value that is NOT the mode of x
#' @keywords Mode
#' @export
#' @examples
#' x <- c("a","a","b","a","a","b")
#' anti_Mode_alpha(x)
#'
anti_Mode_alpha <- function(x) {
	ux <- unique(x[which(!is.na(x))])
	ux[which.min(tabulate(match(x, ux)))]
} # 	Note this breaks down with continuous data .... hence with Beta dsn, rounded to two decimal points.



