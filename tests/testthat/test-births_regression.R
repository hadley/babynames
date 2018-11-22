context("births regression")

test_that("total births are unchanged between start and 2001", {
  expect_known_output(births %>% filter(year <= 2001) %>% summarize(total_births = sum(births)), "test-births_regression_total.txt", print = TRUE)
})

test_that("births head and tail records before 2001 unchanged", {
  expect_known_output(births %>% filter(year <= 2001) %>% arrange(year) %>% first_last(), "test-births_regression_first_last.txt", print = TRUE)
})
