context("timestamp")

test_that("convert timestamp to POSIXct", {
  expect_equal(timestamp_to_posix(1517529605225), as.POSIXct("2018-02-02 00:00:05.225", tz = "UTC"))
})

test_that("convert POSIXct to timestamp", {
  expect_equal(posix_to_timestamp("2018-02-02 00:00:05.225"), 1517529605225)
})
