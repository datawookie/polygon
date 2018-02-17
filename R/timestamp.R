#' Converts numeric timestamp into POSIXct
#'
#' @param msec milliseconds since the epoch
#'
#' @return POSIXct
#' @export
#'
#' @examples
#' timestamp(1517529600225)
timestamp <- function(msec) {
  as.POSIXct(msec / 1000, origin="1970-01-01")
}
