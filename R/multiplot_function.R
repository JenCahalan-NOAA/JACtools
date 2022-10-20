#'
#' Put Multiple Plots on a Page 
#'
#' This function places a list of ggplot objects into a single object. 
#' taken from RBloggers, 3july12, combining ggplot images, <https://www.r-bloggers.com/2012/07/combining-ggplot-images/>
#' 
#' 
#' @param plotlist A list of plots to be combined. Defaults to NULL.
#' @param cols Number of columns of plots. 
#' @keywords ggplot2 multiplot 
#' @export
#' @examples
#' 
#' x <- rnorm(100, 10, 3)
#' y <- rnorm(200, 10, 3)
#' test.dat <- as.data.frame(cbind(x, y))
#' fig.1 <- ggplot2::ggplot(test.dat, aes(x,y)) + geom_point()
#' fig.2 <- ggplot2::ggplot(test.dat[which(test.dat$x > 5),], aes(x,y)) + geom_point()
#' multiplot(fig.1, fig.1, cols=2)
  

multiplot <- function(..., plotlist=NULL, cols) {
        
    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)
    
    numPlots = length(plots)
    
    # Make the panel
    plotCols = cols                          # Number of columns of plots
    plotRows = ceiling(numPlots/plotCols) # Number of rows needed, calculated from # of cols
    
    # Set up the page
    grid::grid.newpage()
    grid::pushViewport(grid::viewport(layout = grid::grid.layout(plotRows, plotCols)))
    vplayout <- function(x, y)
        grid::viewport(layout.pos.row = x, layout.pos.col = y)
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
        curRow = ceiling(i/plotCols)
        curCol = (i-1) %% plotCols + 1
        print(plots[[i]], vp = vplayout(curRow, curCol ))
    }
    
}












