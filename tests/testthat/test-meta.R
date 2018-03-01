context("meta")

API_KEY = Sys.getenv("POLYGON_KEY")

test_that("meta_symbols() returns appropriate data frame", {
  symbols = meta_symbols()
  #
  expect_type(symbols, "list")
  expect_gt(nrow(symbols), 0)
  expect_equal(ncol(symbols), 5)
})
