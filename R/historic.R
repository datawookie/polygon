#' Retrieve historic data for a currency pair
#'
#' @param pair Currency pair
#' @param date Date
#' @param limit Number of records to retrieve
#'
#' @return A data frame
#' @export
#'
#' @examples
#' \dontrun{
#' historic_forex("AUD/USD", "2018-02-02", limit = 20)
#' }
historic_forex <- function(pair, date, limit = 100) {
  check_api_key()
  check_currency_symbol(pair)
  #
  from_to = strsplit(pair, "/")[[1]]
  #
  url = paste("v1/historic/forex", from_to[1], from_to[2], date, sep = "/")
  url = create_url(url, list(limit = limit))
  #
  result = GET(url) %>% content("text") %>% fromJSON()
  #
  result$ticks %>%
    setNames(unlist(result$map)) %>%
    mutate(
      timestamp = timestamp(timestamp),
      pair = pair
    ) %>%
    select(time = timestamp, pair, bid, ask)
}
