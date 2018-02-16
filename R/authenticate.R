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
  if (api_key == "") {
    stop("Invalid API key!", call. = FALSE)
  }
  polygon_env$api_key <- api_key
}
