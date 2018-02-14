library(polygon)

API_KEY = Sys.getenv("POLYGON_KEY")

set_api_key(API_KEY)

print(meta_symbols())
