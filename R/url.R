create_url <- function(endpoint, parameters = NULL) {
  url = paste0("https://api.polygon.io/", endpoint)

  if (length(parameters)) {
    parameters = sapply(names(parameters), function(key) paste0(key, "=", parameters[[key]]))
  }
  #
  parameters = c(parameters, paste("apiKey", polygon_env$api_key, sep = "="))

  paste(url, paste(parameters, collapse = "&"), sep = "?")
}
