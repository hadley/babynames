context("data regression tests")
options(tibble.print_min = 20)
# It is expected that all data has been stored sorted in the same way as the source data.
# For babynames: year, sex, and n
# For applicants: year, sex
# For lifetables: year, desc(sex), x
# For births: year

# convenience function for getting first and last 10 rows
first_last <- function(x) {
  n <- nrow(x)
  if(n >= 20) {
    x[c(1:10, (n - 9):n),]
  } else {
    return(x)
  }
}


test_that("applicants head and tail", {
  expect_known_output(
    first_last(applicants),
    "test-data_applicants_first_last.txt",
    print = TRUE
  )
})

test_that("births head and tail", {
  expect_known_output(
    first_last(births),
    "test-data_births_first_last.txt",
    print = TRUE
  )
})

test_that("lifetables head and tail", {
  expect_known_output(
    first_last(lifetables),
    "test-data_lifetables_first_last.txt",
    print = TRUE
  )
})

test_that("babynames head and tail", {
  expect_known_output(
    first_last(babynames),
    "test-data_babynames_first_last.txt",
    print = TRUE
  )
})
