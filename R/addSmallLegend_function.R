###############################################################################
#' A Function to Decrease the Size of a GGplot Legend
#'
#' This function decreases the size of a ggplot legend for a specified plot. Works for shape, fill, and color legends.
#'   Taken from https://stackoverflow.com/questions/52297978/decrease-overal-legend-size-elements-and-text
#' @param myPlot specifies the plot legend to shrink
#' @param pointSize specifies the size of data points
#' @param textSize specifies the text size for the legend title and text
#' @param spaceLegend specifies the spacing between legend lines
#' @keywords legend ggplot
#' @export
#' @examples
#' addSmallLegend(p)

add_small_legend <- function(myPlot, pointSize = 0.5, textSize = 3, spaceLegend = 0.1) {
    myPlot +
        guides(shape = guide_legend(override.aes = list(size = pointSize)),
               color = guide_legend(override.aes = list(size = pointSize)),
               fill  = guide_legend(override.aes = list(size = pointSize))) +
        theme(legend.title = element_text(size = textSize), 
              legend.text  = element_text(size = textSize),
              legend.key.size = unit(spaceLegend, "lines"))
}
