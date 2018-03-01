library(testthat)
library(polygon)

API_KEY = Sys.getenv("POLYGON_KEY")
#
set_api_key(API_KEY)

test_check("polygon")
