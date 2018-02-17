#' Title
#'
#' @param api_key API key
#'
#' @return None
#' @export
#'
#' @examples
#' set_api_key("KkbzopFGTg3PMv_CNqaMRUfdhiSJ7rzdi9DELl")
set_api_key <- function(api_key) {
  if (api_key == "") {
    stop("Invalid API key!", call. = FALSE)
  }
  polygon_env$api_key <- api_key
}

check_api_key <- function() {
  if (is.null(polygon_env$api_key)) {
    stop("No API key has been set. Please call set_api_key()!", call. = FALSE)
    FALSE
  } else {
    TRUE
  }
}
