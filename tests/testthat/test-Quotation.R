x <- readRDS(here::here("data/exampleQuotation.Rds"))

test_that("Quotation", {
    expect_equal(as.double(x), -8923.99)
    expect_equal(as.character(x), "-8923.99")
})
