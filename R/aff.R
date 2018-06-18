#' @title: aff_read_key_list
#' @description
#'  Read the values corresponding to multiple key names from an aff file.
#' 
#' @param filename Full path to the aff file.
#' @param key_list Vector of key names.
#' @param key_length Number of complex numbered elements to extract from each
#'                   key value, Default: 0
#' @return vector of complex numbers of size = length(key_list) * key_length
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  aff_read_key_list(filename = "piN_piN_diagrams.1700.tsrc04.aff",
#'                    key_list = c("/N-N/n2/bwd/gf100/pf1x01pf1y01pf1z-01/gi100/t52x42y02z22",
#'                                 "/N-N/n2/bwd/gf100/pf1x01pf1y01pf1z-01/gi100/t04x18y26z46"),
#'                    key_length = 25*4*4)
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

#' @title aff_read_key
#' @description
#'  Read the value corresponding to a single key from an aff file. 
#'
#' @param filename Full path to the aff file.
#' @param key Name of the key to extract (string)
#' @param key_length Number of elements to extract from the value referred to by 'key', Default: 0
#' @return vector of complex numbers of size 'key_length'
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  aff_read_key(filename = "piN_piN_diagrams.1700.tsrc04.aff",
#'               key = "/N-N/n2/bwd/gf100/pf1x01pf1y01pf1z-01/gi100/t52x42y02z22",
#'               key_length = 25*4*4)
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
