#' Database Connect Function
#'
#' Opens connection to Oracle database schemas (RODBC)
#' This function opens RODBC connections to database schemas such as the AFSC schemas. Users will be prompted for username and password.
#'       schema defaults to 'AFSC'
#' @param schema The name of the schema to establish a connection with, in quotes. IMPORTANT: TNS.names file must include target schema. Defaults to AFSC.
#' @keywords database connection

#' @examples
#' get_connected()
#' @export

get_connected <- function(schema='AFSC'){
	(echo=FALSE)
	username <- readline('Enter User Name  \n')
	password <- readline('Enter Password  \n')
	cat(rep("\n",150))
	
	channel <- RODBC::odbcConnect(paste(schema),paste(username),paste(password), believeNRows=FALSE)
}
