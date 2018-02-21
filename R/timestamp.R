#' Converts numeric timestamp into POSIXct
#'
#' @param msec milliseconds since the epoch
#'
#' @return POSIXct
#'
#' @examples
#' timestamp_to_posix(1517529605225)
timestamp_to_posix <- function(msec) {
  as.POSIXct(msec / 1000, origin="1970-01-01", tz = "UTC")
}

#' Converts POSIXct to numeric timestamp
#'
#' @param posix POSIXct
#'
#' @return
#'
#' @examples
posix_to_timestamp <- function(posix) {
  # Coerce string to POSIXct.
  if (!("POSIXct" %in% class(.Last.value))) posix <- as.POSIXct(posix, tz = "UTC")
  #
  as.numeric(posix) * 1000
}
# timestamp_to_posix(1517529605225)
# timestamp_to_posix(1517529605225)
# posix_to_timestamp("2018-02-02 00:00:05.225")
