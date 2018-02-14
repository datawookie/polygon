NATS_SERVERS = c("nats://nats1.polygon.io:30401", "nats://nats2.polygon.io:30402", "nats://nats3.polygon.io:30403")

polygon_env <- new.env()

set_api_key <- function(api_key) {
  polygon_env$api_key <- api_key
}

create_url <- function(endpoint, parameters) {
  url = paste0("https://api.polygon.io/", endpoint)

  if (length(parameters)) {
    parameters = sapply(names(parameters), function(key) paste0(key, "=", parameters[[key]]))
  }
  #
  parameters = c(parameters, paste("apiKey", polygon_env$api_key, sep = "="))

  paste(url, paste(parameters, collapse = "&"), sep = "?")
}
