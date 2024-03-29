% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addSmallLegend_function.R
\name{add_small_legend}
\alias{add_small_legend}
\title{A Function to Decrease the Size of a GGplot Legend}
\usage{
add_small_legend(myPlot, pointSize = 0.5, textSize = 3, spaceLegend = 0.1)
}
\arguments{
\item{myPlot}{specifies the plot legend to shrink}

\item{pointSize}{specifies the size of data points}

\item{textSize}{specifies the text size for the legend title and text}

\item{spaceLegend}{specifies the spacing between legend lines}
}
\description{
This function decreases the size of a ggplot legend for a specified plot. Works for shape, fill, and color legends.
Taken from \url{https://stackoverflow.com/questions/52297978/decrease-overal-legend-size-elements-and-text}
}
\examples{
addSmallLegend(p)
}
\keyword{ggplot}
\keyword{legend}
