#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param filename PARAM_DESCRIPTION
#' @param key_list PARAM_DESCRIPTION
#' @param key_length PARAM_DESCRIPTION, Default: 0
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  aff_read_key_list(filename = "piN_piN_diagrams.1700.tsrc04.keys",
                      
#'  }
#' }
#' @rdname aff_read_key_list
#' @export
#' @useDynLib Raff aff_read_key_list_interface
aff_read_key_list <- function(filename, key_list, key_length = 0) {
  if (missing(filename)) {
    stop("need AFF filename")
  }
  
  if (missing(key_list)) {
    stop("need key list")
  }
  
  if (missing(key_length)) {
    stop("need length of data key")
  }
  
  if (!is.character(filename) || !is.character(key_list)) {
    stop("wrong argument types!\n")
  }
  
  if (key_length <= 0) {
    stop("key length must be positive")
  }
  
  key_num <- length(key_list)
  
  return(.Call("aff_read_key_list_interface",
               as.character(filename),
               as.character(key_list),
               as.integer(key_num),
               as.integer(key_length)
               )
        )
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param filename PARAM_DESCRIPTION
#' @param key PARAM_DESCRIPTION
#' @param key_length PARAM_DESCRIPTION, Default: 0
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname aff_read_key
#' @export 
#' @useDynLib Raff aff_read_key_interface
aff_read_key <- function(filename, key, key_length=0){
  if ( missing(filename) ) {
    stop("need AFF filename")
  }
  if ( missing(key) ) {
    stop("need key")
  }
  if ( missing(key_length) ) {
    stop ( "need length of data key" )
  }

  if ( !is.character(filename) || !is.character(key) ) {
    stop("wrong argument types!\n")
  }

  if (key_length <= 0) {
    stop("key length must be positive")
  }

  return(.Call("aff_read_key_interface",
               as.character(filename),
               as.character(key),
               as.integer(key_length)
               )
        )
}
