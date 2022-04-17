library(dplyr)
library(reshape2)
library(readr)

if (!file.exists("data-raw/names")) {
  tmp <- tempfile(fileext = ".zip")
  download.file("https://www.ssa.gov/oact/babynames/names.zip", tmp, quiet = TRUE)
  unzip(tmp, exdir = "data-raw/names")
  unlink(tmp)
}

# From: http://www.ssa.gov/oact/babynames/limits.html
all <- dir("data-raw/names", "\\.txt$", full.names = TRUE)
year <- as.numeric(gsub("[^0-9]", "", basename(all)))

data <- lapply(all, read_csv, col_names = FALSE, col_types = list(X2 = col_character()))

one <- dplyr::bind_rows(data)
names(one) <- c("name", "sex", "n")
one$year <- rep(year, vapply(data, nrow, integer(1)))

babynames <- one %>%
  tibble::as_tibble() %>%
  select(year, sex, name, n) %>%
  arrange(year, sex, desc(n)) %>%
  left_join(applicants, by = c("year", "sex")) %>%
  mutate(prop = zapsmall(n / n_all)) %>%
  select(-n_all) %>%
  arrange(year, sex, desc(n)) %>%
  # avoid a data-type change between package versions
  mutate(n = as.integer(n))

readr::write_csv(babynames[1:nrow(babynames) %% 1000 == 0 & babynames$n > 1000,], "data-raw/babynames_sample.csv")
usethis::use_data(babynames, compress = "xz", overwrite = T)
