#' polygon: An R package ...
#'
#' @docType package
#' @name polygon
#'
#' @import dplyr
#' @import httr
#' @import jsonlite
NULL

.onLoad <- function(libname, pkgname){
  # Display time with millisecond precision.
  #
  options(digits.secs = 3)
}
