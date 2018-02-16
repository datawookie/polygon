# Display time with millisecond precision.
#
options(digits.secs = 3)

#' Title
#'
#' @param msec milliseconds since the epoch
#'
#' @return
#' @export
#'
#' @examples
timestamp <- function(msec) {
  as.POSIXct(msec / 1000, origin="1970-01-01")
}
