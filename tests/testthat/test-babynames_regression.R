context("babynames regression")
max_year <- 2015

test_that(paste0("babynames head unchanged"), {
  expect_known_output(babynames %>% arrange(year, sex, name) %>% head(), "babynames_regression_head.txt", print = TRUE)
})

test_that("total names and children by sex unchanged since 2015", {
  expect_known_output(
    babynames %>% filter(year <= max_year) %>% group_by(sex) %>% summarize(total_names = n_distinct(name), total_children = sum(n)) %>% arrange(sex),
    "test-babynames_regression_name_and_child_count_by_gender.txt",
    print = TRUE
  )
})

test_that("babynames head and tail 2015 and before unchanged", {
  expect_known_output(
    babynames %>% filter(year <= max_year) %>% arrange(year, sex) %>% first_last(),
    "test-babynames_regression_first_last.txt",
    print = TRUE
  )
})
