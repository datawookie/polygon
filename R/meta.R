#' Title
#'
#' @return
#' @export
#'
#' @examples
meta_symbols <- function() {
  url = create_url("v1/meta/symbols", list(sort = "symbol", perpage = 50, page = 1))
  GET(url) %>% content("text") %>% fromJSON() %>% .$symbols
}

#' Title
#'
#' @return
#' @export
#'
#' @examples
meta_currency_symbols <- function() {
  url = create_url("v1/meta/currency-symbols", list())
  GET(url) %>% content("text") %>% fromJSON()
}

#' Checks whether currency pair is supported.
#'
#' @param pair
#'
#' @return
#'
#' @examples
check_currency_symbol <- function(pair) {
  if (is.null(polygon_env$currency_symbols)) {
    polygon_env$currency_symbols <- meta_currency_symbols()
  }
  if (pair %in% polygon_env$currency_symbols) {
    TRUE
  } else {
    stop("Currency pair ", pair, " is not supported!", call. = FALSE)
  }
}
