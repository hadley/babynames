context("lifetables regression")

test_that("lifetables records are unchanged between start and 2010", {
  expect_known_output(lifetables %>% arrange(year, sex, x) %>% filter(year <= 2010), "lifetables_regression.txt", print = TRUE)
})

test_that("variance/covariance of data prior to 2010 is stable ", {
  expect_known_output(
    lifetables %>%
      mutate(sex = case_when(sex == "F" ~ 1, TRUE ~ 2)) %>%
      filter(year >= 2010) %>%
      var(),
    "lifetables_var_covar.txt",
    print = TRUE
  )
})
