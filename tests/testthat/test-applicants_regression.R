context("applicants regression")
max_year <- 2015

test_that(paste0("applicants records are unchanged between start and ", max_year), {
  expect_known_output(applicants %>% arrange(year, sex) %>% filter(year <= max_year), "applicants_regression.txt", print = TRUE)
})

test_that(paste0("applicants variance/covariance unchanged between start and ", max_year), {
  expect_known_output(
    applicants %>% mutate(sex = case_when(sex == "F" ~ 1, TRUE ~ 2)) %>% var(),
    "applicants_regression_var_covar.txt",
    print = TRUE
  )
})
