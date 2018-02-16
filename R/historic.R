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
historic_forex <- function(from, to, date, limit = 100) {
  url = paste("v1/historic/forex", from, to, date, sep = "/")
  url = create_url(url, list(limit = limit))
  #
  result = GET(url) %>% content("text") %>% fromJSON()
  #
  result$ticks %>%
    setNames(unlist(result$map)) %>%
    mutate(timestamp = timestamp(timestamp)) %>%
    select(time = timestamp, everything())
}
