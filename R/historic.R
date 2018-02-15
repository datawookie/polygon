# https://api.polygon.io/v1/historic/forex/AUD/USD/2018-2-2?limit=100&apiKey=KkbmapFGTg0OMv_CNqaMRUfdhiSJ4qzdi5DELl
# https://api.polygon.io/v1/historic/forex/AUD/USD/2018-2-2?limit=100&apiKey=KkbmapFGTg0OMv_CNqaMRUfdhiSJ4qzdi5DELl

#' Title
#'
#' @param from
#' @param to
#' @param date
#'
#' @return
#' @export
#'
#' @examples
historic_forex <- function(from, to, date) {
  url = paste("v1/historic/forex", from, to, date, sep = "/")
  url = create_url(url, list(limit = 100))
  #
  result = GET(url) %>% content("text") %>% fromJSON()
  #
  result$ticks %>%
    setNames(unlist(result$map)) %>%
    mutate(timestamp = timestamp(timestamp)) %>%
    select(time = timestamp, everything())
}
