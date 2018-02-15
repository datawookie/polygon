NATS_SERVERS = c("nats://nats1.polygon.io:30401", "nats://nats2.polygon.io:30402", "nats://nats3.polygon.io:30403")

polygon_env <- new.env()

#' Title
#'
#' @param api_key
#'
#' @return
#' @export
#'
#' @examples
set_api_key <- function(api_key) {
  polygon_env$api_key <- api_key
}
