library(dplyr)
library(XML)
library(reshape2)

load("data/applicants.rdata")

if (!file.exists("data-raw/names")) {
  tmp <- tempfile(fileext = ".zip")
  download.file("http://www.ssa.gov/oact/babynames/names.zip", tmp, quiet = TRUE)
  unzip(tmp, exdir = "data-raw/names")
  unlink(tmp)
}

# From: http://www.ssa.gov/oact/babynames/limits.html
all <- dir("data-raw/names", "\\.txt$", full.names = TRUE)
year <- as.numeric(gsub("[^0-9]", "", basename(all)))

data <- lapply(all, read.csv, 
  colClasses = c("character", "character", "integer"), 
  header = FALSE
)

one <- dplyr::rbind_all(data)
names(one) <- c("name", "sex", "n")
one$year <- rep(year, vapply(data, nrow, integer(1)))

babynames <- one %>% 
  select(year, sex, name, n) %>%
  arrange(year, sex, desc(n)) %>%
  left_join(applicants) %>%
  mutate(prop = n / n_all) %>%
  select(-n_all)

save(babynames, file = "data/names.rdata")
