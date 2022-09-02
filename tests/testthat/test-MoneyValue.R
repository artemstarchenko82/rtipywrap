x <- readRDS(here::here("data/exampleMoneyValue.Rds"))

test_that("MoneyVaue", {
  expect_equal(as.double(x), -89.77)
  expect_equal(as.character(x), "-89.77 usd")
  expect_equal(x$currency, "usd")
})
