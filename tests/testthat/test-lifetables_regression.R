context("lifetables regression")

test_that("lifetables records are unchanged between start and 2010", {
  expect_known_output(lifetables %>% arrange(year, sex, x) %>% filter(year <= 2010), "lifetables_regression.txt", print = TRUE)
})

test_that("head and tail of data prior to 2010 is stable ", {
  expect_known_output(
    lifetables %>%
      filter(year >= 2010) %>%
      arrange(year) %>%
      first_last(),
    "test-lifetables_regression_first_last.txt",
    print = TRUE
  )
})
