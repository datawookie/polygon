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
