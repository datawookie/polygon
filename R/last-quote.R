#' Title
#'
#' @param pair
#'
#' @return
#' @export
#'
#' @examples
#' last_quote_forex("AUD/USD")
last_quote_forex <- function(pair) {
  check_api_key()
  check_currency_symbol(pair)
  #
  from_to = strsplit(pair, "/")[[1]]
  #
  url = paste("v1/last_quote/currencies", from_to[1], from_to[2], sep = "/")
  url = create_url(url)
  #
  result = GET(url) %>% content("text") %>% fromJSON()
  #
  result$last %>%
    as_tibble() %>%
    mutate(
      timestamp = timestamp(timestamp),
      pair = pair
    ) %>%
    select(-exchange) %>%
    select(time = timestamp, pair, everything())
}
