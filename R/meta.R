#' List of supported stocks
#'
#' @return A data frame
#' @export
meta_symbols <- function() {
  check_api_key()
  #
  url = create_url("v1/meta/symbols", list(sort = "symbol", perpage = 50, page = 1))
  GET(url) %>% content("text") %>% fromJSON() %>% .$symbols
}

#' List of supported currency symbols
#'
#' @return A vector
#' @export
meta_currency_symbols <- function() {
  check_api_key()
  #
  url = create_url("v1/meta/currency-symbols", list())
  GET(url) %>% content("text") %>% fromJSON()
}

#' Checks whether currency pair is supported.
#'
#' @param pair Currency pair
#'
#' @return
#'
#' @examples
#' \dontrun{
#' check_currency_symbol("GBP/USD")
#' check_currency_symbol("USD/GBP")
#' }
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
