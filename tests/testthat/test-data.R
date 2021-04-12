# It is expected that all data has been stored sorted in the same way as the source data.
# For babynames: year, sex, and desc(n)
# For applicants: year, sex
# For lifetables: year, sex, x; note that sex is a factor, M is 1, F is 2
# For births: year

test_that("applicants head and tail", {
  old <- options(tibble.print_min = 20)
  on.exit(options(old))

  first_last <- function(x) {
    n <- nrow(x)
    if(n >= 20) {
      x[c(1:10, (n - 9):n),]
    } else {
      return(x)
    }
  }

  expect_snapshot(first_last(applicants))
  expect_snapshot(first_last(births))
  expect_snapshot(first_last(lifetables))
  expect_snapshot(first_last(lifetables[lifetables$year == 1990,]))

  expect_snapshot(first_last(babynames))
  expect_snapshot(first_last(babynames[babynames$year == 1990,]))
})
