#'
#' Share a Common Legend for Multiple Plots on a Page 
#'
#' This function places a list of ggplot objects into a single object and
#'    provides a shared legend for those plots.
#'    Plots are stacked - one column.
#' 
#' @param plotlist A list of plots to be combined. Defaults to NULL.
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
#' grid_arrange_shared_legend(fig.1, fig.1)

 grid_arrange_shared_legend <- function(...) {
	plots <- list(...)
	g <- ggplot2::ggplotGrob(plots[[1]] + theme(legend.position="bottom"))$grobs
	legend <- g[[which(sapply(g, function(x) x$name) == "guide-box")]]
	lheight <- sum(legend$height)
	gridExtra::grid.arrange(
			do.call(gridExtra::arrangeGrob, lapply(plots, function(x)
				x + theme(legend.position="none"))),
			legend,
			ncol = 1,
			heights = unit.c(unit(1, "npc") - lheight, lheight))
}









