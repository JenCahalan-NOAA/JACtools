#'
#' Share a Common Legend for Multiple Stacked Plots on a Page 
#'
#' This function places a list of ggplot objects into a single object and
#'    provides a shared legend for those plots.   \cr 
#'    Plots can be stacked (ncol = 1) or side=by-side (nrow = 1); defauls to stacked.   \cr 
#'    Legend can be place on the bottom or right side of the plots; position must be specified in the function call. \cr\cr
#' This function has been adapted from: <https://rdrr.io/github/josiahpjking/jkr/src/R/grid_arrange_shared_legend.R> and \cr 
#' <https://github.com/tidyverse/ggplot2/wiki/Share-a-legend-between-two-ggplot2-graphs>
#' 
#' @param plotlist A list of plots to be combined. Defaults to NULL.
#' @param position Position of the legend on the plots, must be specified as "right" or "bottom"
#' @param nrow number of plot rows
#' @param ncol number of plot columns (defaults to nr of plots)
#' @keywords ggplot2 multiplot legend
#' @export
#' @examples
#' 
#' x <- rnorm(200, 10, 3)
#' y <- rnorm(200, 10, 3)
#' z <- rep(c('Up', 'Down'),200)
#' test.dat <- as.data.frame(cbind(x, y,z))
#' fig.1 <- ggplot2::ggplot(test.dat, aes(x,y)) + geom_point(aes(color=z))
#' fig.2 <- ggplot2::ggplot(test.dat[which(test.dat$x > 5),], aes(x,y)) + geom_point(aes(color=z))
#' grid_arrange_shared_legend(fig.1, fig.1, ncol=2, position = "bottom")

 grid_arrange_shared_legend <- function(..., ncol = length(list(...)), nrow = 1, position = c("bottom", "right")) {
	plots <- list(...)
	g <- ggplot2::ggplotGrob(plots[[1]] + theme(legend.position="bottom"))$grobs
	legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
	lheight <- sum(legend$height)
	lwidth <- sum(legend$width)
	
	combined <- switch(position,
	"bottom" = gridExtra::grid.arrange(
			do.call(gridExtra::arrangeGrob, lapply(plots, function(x)
				x + theme(legend.position="none"))),
			legend,
			ncol = 1,
			heights = unit.c(unit(1, "npc") - lheight, lheight)),
	"right" = gridExtra::grid.arrange(
			do.call(gridExtra::arrangeGrob, lapply(plots, function(x)
								x + theme(legend.position="none"))),
			legend,
			ncol = 2,
			widths = unit.c(unit(1, "npc") - lwidth, lwidth)))
}
