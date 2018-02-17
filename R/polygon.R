#' polygon: An R package ...
#'
#' @docType package
#' @name polygon
#'
#' @import dplyr
#' @import httr
#' @import jsonlite
#' @importFrom stats setNames
NULL

# Stops R CMD check from complaining "no visible binding for global variable ‘.’".
#
if (getRversion() >= "2.15.1") utils::globalVariables(c("."))

# Create global environment.
#
polygon_env <- new.env()

.onLoad <- function(libname, pkgname) {
  # Display time with millisecond precision.
  #
  options(digits.secs = 3)
}

.onAttach <- function(libname, pkgname) {
}
