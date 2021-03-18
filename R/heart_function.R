#' A Heart Function
#'
#' This function places a message on a heart-shaped plot
#'     I have no idea from whence this function came to me.
#' 
#' @param message A message to write on the heart. Defaults to 'Happy Valentine's Day'
#' @param name A name to be included under the message. Defaults to NULL
#' @param text.color Text color. Defaults to 'blue'
#' @keywords heart
#' @export
#' @examples
#' heart_fxn('Jen', 'Hello', 'green')
#' heart_fxn('Hello')
#' heart_fxn(message = 'Hello')

heart_fxn <- function(name=NULL, message="Happy Valentine's Day", text.color='blue'){
	t <- seq(0,60,len=100)
	plot(c(-8,8),c(0,20),type='n',axes=FALSE,xlab='',ylab='', asp=1)
	x <- -.01*(-t^2+40*t+1200)*sin(pi*t/180)
	y <- .01*(-t^2+40*t+1200)*cos(pi*t/180)
	lines(x,y, lwd=4)
	lines(-x,y, lwd=4)
	text(0,7, paste(message), col=text.color,cex=2.5)
	text(0,5.5,name,col=text.color,cex=2.5)
}

