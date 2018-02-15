#' Title
#'
#' @param msec milliseconds since the epoch
#'
#' @return
#' @export
#'
#' @examples
timestamp <- function(msec) {
  # TODO: Handle fractional component.
  sec = msec %/% 1000
  as.POSIXct(sec, , origin="1970-01-01")
}
