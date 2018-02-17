library(polygon)

API_KEY = Sys.getenv("POLYGON_KEY")

set_api_key(API_KEY)

print(meta_symbols())
print(meta_currency_symbols())

historic_forex("AUD/USD", "2018-02-02", limit = 20)
historic_forex("GBP/USD", "2018-02-05")

# This should generate an error.
#
historic_forex("USD/GBP", "2018-02-05")

last_quote_forex("AUD/USD")
last_quote_forex("GBP/USD")

# This should generate an error.
#
last_quote_forex("USD/GBP")
