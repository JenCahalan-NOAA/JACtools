#' Place Sample Size on Boxplots at Mean y-value
#'
#' This function returns the length (number of observations, n) and the mean of a vector. 
#' When used with ggplot, it can to place the number of observations within the box of a box-and-whisker plot into the box at the mean value of the observations. 
#' 
#' @param x A numeric vector.
#' @keywords sample size; boxplot
#' @export
#' @examples
#' color.dat <- c(rep('A', 10),rep('B', 10))
#' y.dat <- c(rnorm(10,2, 2), rnorm(10,5,5))
#' example.dat <- data.frame(color.dat,y.dat)
#' (ggplot2::ggplot(example.dat, aes(y=y.dat, x=color.dat, fill=color.dat))
#'			+ geom_boxplot(color='grey30', aes(fill=color.dat))
#'			+ stat_summary(fun.data = give_n, geom = "text", position = position_dodge(width = 0.75), size = 5, color='red')
#'			+ scale_fill_manual('', values=c("grey80","grey60"))
#'			+ theme_bw())

give_n <- function(x){
	return(c(y = mean(x), label = length(x)))
}

##########################################################################################################
#' Place Sample Size on Boxplots at Fixed y-value
#'
#' This function returns the length (number of observations, n) of a vector and a pre-specified y-value (V). 
#' When used with ggplot, it can to place the number of observations within the box of a box-and-whisker plot into the box at the specified Y-value (V). 
#' Note that the parameter V must be specified before using the function.
#' 
#' @param x A numeric vector.
#' @param V The y-value for the label (n).
#' @keywords sample size; boxplot
#' @export
#' @examples
#' color.dat <- c(rep('A', 10),rep('B', 10))
#' y.dat <- c(rnorm(10,2, 2), rnorm(10,5,5))
#' example.dat <- data.frame(cbind(color.dat,as.numeric(y.dat)))
#' V <- 5
#' (ggplot(example.dat, aes(y=y.dat, x=color.dat, fill=color.dat))
#'			+ geom_boxplot(color='grey30', aes(fill=color.dat))
#'			+ stat_summary(fun.data = give.Vn, geom = "text", position = position_dodge(width = 0.75), size = 5, color='red')
#'			+ scale_fill_manual('', values=c("grey80","grey60"))
#'			+ theme_bw())

give_Vn <- function(x){
	return(c(y = V, label = length(x)))
}


##########################################################################################################
#' Place Sample Size on Boxplots at Specified Quartile
#'
#' This function returns the length (number of observations, n) of a vector and a pre-specified quartile (Q). 
#' When used with ggplot, it can to place the number of observations within the box of a box-and-whisker plot into the box at the specified Y-value quartile (Q). 
#' Note that the parameter Q must be specified before using the function.
#' 
#' @param x A numeric vector.
#' @param Q The quartile (y-value) for the label (n). Q must be between 0 and 1.
#' @keywords sample size; boxplot
#' @export
#' @examples
#' color.dat <- c(rep('A', 10),rep('B', 10))
#' y.dat <- c(rnorm(10,2, 2), rnorm(10,5,5))
#' example.dat <- data.frame(cbind(color.dat,as.numeric(y.dat)))
#' Q <- 0.75
#' (ggplot(example.dat, aes(y=y.dat, x=color.dat, fill=color.dat))
#'			+ geom_boxplot(color='grey30', aes(fill=color.dat))
#'			+ stat_summary(fun.data = give.Qn, geom = "text", position = position_dodge(width = 0.75), size = 5, color='red')
#'			+ scale_fill_manual('', values=c("grey80","grey60"))
#'			+ theme_bw())

give.Qn <- function(x){
	return(c(y = quantile(x, probs = Q, na.rm = TRUE, names=FALSE), label = length(x)))
}







