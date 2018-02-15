library(polygon)

API_KEY = Sys.getenv("POLYGON_KEY")

set_api_key(API_KEY)

print(meta_symbols())
print(meta_currency_symbols())

historic_forex("AUD", "USD", "2018-02-02")
