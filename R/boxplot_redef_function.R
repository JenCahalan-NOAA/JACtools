#' A function to set the hinges of boxplt equal to 1 Std. Dev
#'
#' This function re-defines the hinges of a boxplot to equal the mean +/- one standard deviation of the data and the whiskers to be the range of the data (min and max).
#'     See also mean.2sd for box defined by 1.96 std. dev 
#' @param x a vector of numeric data
#' @keywords boxplot, Std.Dev, Std.Err
#' @export
#' @examples
#' a <- rnorm(50, 0, 1)
#' b <- rnorm(120, 0.5, 1.5)
#' c <- rnorm(70, 1, 0.5)
#' d <- rnorm(15, 0,1)
#' group <- factor(rep(1:4, c(50, 120, 70, 15)))
#'
#' mydata <- data.frame(c(a,b,c,d), group)
#' names(mydata) <- c("value", "group")
#'
#' p1 <- ggplot(aes(y = value, x = factor(group)), data = mydata)
#' p1 <- (p1 + stat_summary(fun.data = mean.sd, geom = "boxplot") 
#'           + geom_jitter(position=position_jitter(width=.2), size=1.5) 
#'           + ggtitle("Boxplot con media, 1 Std. Dev., valore min. e max.") + xlab("Gruppi") + ylab("Valori"))
#' p1
#'
mean_sd <- function(x) {
    r <- c(min(x), mean(x) - sd(x), mean(x), mean(x) + sd(x), max(x))
    names(r) <- c("ymin", "lower", "middle", "upper", "ymax")
    r
}
##########################################################################################
#' A Function to set the hinges of boxplt equal to 1.96 Std. Dev
#'
#' This function re-defines the hinges of a boxplot to equal the mean +/- 1.96 standard deviation of the data and the whiskers to be the range of the data (min and max).
#'     If datapoints are normally distributed, this would equate to +/- 95% Confidence Interval
#'     See also mean.sd for box defined by 1 std. dev 
#' 
#' @param x a vector of numeric data
#' @keywords boxplot, Std.Dev, Std.Err
#' @export
#' @examples
#' a <- rnorm(50, 0, 1)
#' b <- rnorm(120, 0.5, 1.5)
#' c <- rnorm(70, 1, 0.5)
#' d <- rnorm(15, 0,1)
#' group <- factor(rep(1:4, c(50, 120, 70, 15)))
#'
#' mydata <- data.frame(c(a,b,c,d), group)
#' names(mydata) <- c("value", "group")
#'
#' p2 <- ggplot(aes(y = value, x = factor(group)), data = mydata)
#' p2 <- (p1 + stat_summary(fun.data = mean.2sd, geom = "boxplot") 
#'			+ geom_jitter(position=position_jitter(width=.2), size=1.5) 
#'			+ ggtitle("Boxplot con media, 2Std. Dev. (95%CI), valore min. e max.") + xlab("Gruppi") + ylab("Valori"))
#' p2
#'
mean_2sd <- function(x) {
	r <- c(min(x), mean(x) - 1.96*sd(x), mean(x), mean(x) + 1.96*sd(x), max(x))
	names(r) <- c("ymin", "lower", "middle", "upper", "ymax")
	r
}
