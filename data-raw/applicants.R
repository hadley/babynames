# Number of applicants -------------------------

library(dplyr, warn.conflicts = FALSE)
library(XML)
library(tidyr)

ssa <- readHTMLTable("http://www.ssa.gov/oact/babynames/numberUSbirths.html")[[2]]
names(ssa) <- c("year", "M", "F", "total")
ssa$total <- NULL
ssa <- ssa[-1, ]

ssa$year <- as.integer(as.character(ssa$year))
ssa$M <- as.integer(gsub(",", "", ssa$M))
ssa$F <- as.integer(gsub(",", "", ssa$F))

applicants <- ssa %>%
  tbl_df() %>%
  gather(sex, n_all, M:F) %>%
  mutate(sex = as.character(sex)) %>%
  arrange(year, sex)

save(applicants, file = "data/applicants.rdata")
