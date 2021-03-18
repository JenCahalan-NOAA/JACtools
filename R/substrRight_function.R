#' A Right-handed Substring Function
#'
#' This function returns a portion of a string, counted from the right-hand margin. Useful for strings of uneven length where the trailing digits are of interest.
#'     This function is similar to base::substr() except that the offset if counted from the right.
#'     
#' 
#' @param x a vector, if not a character vector, will be coerced using as.character 
#' @param n the number of elements from the right margin to start counting from 
#' @param k the number of elements to include in the resulting string
#' @keywords substr
#' @export
#' @examples
#' substr("abcdef", 2, 4)
#' substrRight(X, 3, 2)
#' X <- c(3846250)
#' substrRight(X, 4, 2)

substrRight <- function(x, n, k){
	substr(x, nchar(x)-n+1, nchar(x)-n+k)
}
