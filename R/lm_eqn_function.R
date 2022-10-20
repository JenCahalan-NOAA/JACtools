#' Place a lm equation onto a ggplot
#'
#' This function places the equation used by geom_smooth(method='lm') onto a ggplot by creating a character string from the regression. \cr
#' 
#'    Code for this function originated here: <https://stackoverflow.com/questions/7549694/add-regression-line-equation-and-r2-on-graph>
#'    and was adapted from here: <https://groups.google.com/g/ggplot2/c/1TgH-kG5XMA>
#'
#' @param df A The dataframe used to create the regression
#' @param y Regression dependant variable (y-axis of plot)
#' @param x regression independant variable (x-axis of plot)
#' @keywords lm regression ggplot geom_smooth
#' @export
#' @examples
#'  x <- rnorm(100, 10, 3)
#'  y <- 2*x + 5 + rnorm(100, 0, 3)
#'  test.dat <- as.data.frame(cbind(x, y))
#'  p <- (ggplot2::ggplot(test.dat, aes(x,y)) 
#'			 + ggplot2::geom_point() 
#'			 + ggplot2::geom_smooth(method='lm',se=FALSE, color='yellow', size=1)
#'             + (ggplot2::geom_text(x=10,y=10,label=lm_eqn_fxn(test.dat, 'y','x'), color='black',parse=T, size = 3) )
#'			 )
#'  p

lm_eqn_fxn <- function(df, y, x){
	formula = as.formula(sprintf('%s ~ %s', y, x))
	m <- lm(formula, data=df);
	# formating the values into a summary string to print out
	# ~ give some space, but equal sign and comma need to be quoted
	eq <- substitute(italic(target) == a + b %.% italic(input)*","~~italic(r)^2~"="~r2*","~~p~"="~italic(pvalue), 
			list(target = y,
					input = x,
					a = format(as.vector(coef(m)[1]), digits = 2), 
					b = format(as.vector(coef(m)[2]), digits = 2), 
					r2 = format(summary(m)$r.squared, digits = 3),
					# getting the pvalue is painful
					pvalue = format(summary(m)$coefficients[2,'Pr(>|t|)'], digits=1)
			)
	)
	as.character(as.expression(eq));                 
}