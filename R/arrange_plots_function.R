#' Arrange Multiple Plots on a Page 
#'
#' This function places a list of ggplot objects into a single object. 
#' taken from RBloggers, 3july12, combining ggplot images (https://www.r-bloggers.com/combining-ggplot-images/)
#' 
#' 
#' @param plotlist A list of plots to be arranged. Defaults to NULL.
#' @param ncol Number of columns of plots, defaults to NULL
#' @param nrow Number of rows of plots, defaults to NULL
#' 
#' depends: ggplot2,
#'          grid
#' 
#' @keywords ggplot2 multiplot 
#' @export
#' @examples
#' x <- rnorm(100, 10, 3)
#' y <- rnorm(200, 10, 3)
#' test.dat <- as.data.frame(cbind(x, y))
#' fig.1 <- ggplot2::ggplot(test.dat, aes(x,y)) + geom_point()
#' fig.2 <- ggplot2::ggplot(test.dat[which(test.dat$x > 5),], aes(x,y)) + geom_point()
#'
#'   p1 <- qplot(wt, mpg, data=mtcars)
#'   p2 <- ggplot(diamonds, aes(price, colour = cut)) +
#'                      geom_density()
#'    arrange_plots(p1,p2)
#'
	arrange_plots <- function(..., nrow=NULL, ncol=NULL, as.table=FALSE) {

	vp.layout <- function(x, y) viewport(layout.pos.row=x, layout.pos.col=y)

    	  dots <- list(...)
    	  n <- length(dots)
    	  if(is.null(nrow) & is.null(ncol)) { nrow = floor(n/2) ; ncol = ceiling(n/nrow)}
    	  if(is.null(nrow)) { nrow = ceiling(n/ncol)}
    	  if(is.null(ncol)) { ncol = ceiling(n/nrow)}
    	  ## NOTE see n2mfrow in grDevices for possible alternative
    	  grid.newpage()
    	  pushViewport(viewport(layout=grid.layout(nrow,ncol) ) )
    	  ii.p <- 1
    	  for(ii.row in seq(1, nrow)){
        	    ii.table.row <- ii.row
        	    if(as.table) {ii.table.row <- nrow - ii.table.row + 1}
        	    for(ii.col in seq(1, ncol)){
            	      ii.table <- ii.p
            	      if(ii.p > n) break
            	      print(dots[[ii.table]], vp=vp.layout(ii.table.row, ii.col))
            	      ii.p <- ii.p + 1
            	    }
        	  }
    	}
        












