context("births regression")

test_that("total births are unchanged between start and 2001", {
  expect_known_output(births %>% filter(year <= 2001) %>% summarize(total_births = sum(births)), "births_regression_total.txt", print = TRUE)
})

test_that("births correlation with year between start and 2001 unchanged", {
  expect_known_output(births %>% filter(year <= 2001) %>% cor(), "births_regression_correlation.txt", print = TRUE)
})
