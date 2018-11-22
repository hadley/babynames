context("applicants regression")
max_year <- 2015

test_that(paste0("applicants head and tail between start and ", max_year, " unchanged"), {
  expect_known_output(
    applicants %>% arrange(year, sex) %>% filter(year <= max_year) %>% first_last(),
    "test-applicants_regression_first_last.txt",
    print = TRUE
  )
})
