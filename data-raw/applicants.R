# Number of applicants -------------------------

library(dplyr, warn.conflicts = FALSE)
library(rvest)
library(tidyr)
library(readr)

page <- read_html("https://www.ssa.gov/oact/babynames/numberUSbirths.html")

ssa <- page %>% html_nodes("table") %>% .[[2]] %>% html_table() %>% tbl_df()
names(ssa) <- c("year", "M", "F", "total")
ssa$total <- NULL

ssa$M <- parse_number(ssa$M)
ssa$F <- parse_number(ssa$F)

applicants <- ssa %>%
  gather(sex, n_all, M:F) %>%
  arrange(year, sex)

write_csv(applicants, "data-raw/applicants.csv")
devtools::use_data(applicants, overwrite = TRUE)
