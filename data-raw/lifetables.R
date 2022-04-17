library(xml2)
library(rvest)
library(tidyr)
library(dplyr)
library(usethis)

get_lifetables <- function(year){
  url <- "http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7_%s.html"
  tab <- xml2::read_html(sprintf(url, year)) %>% rvest::html_table(fill = TRUE) %>% {.[[2]]}
  nms <- c("x", "qx", "lx", "dx", "Lx", "Tx", "ex", "sex")
  tab_m <- setNames(cbind(tab[-1,1:7], 'M'), nms)
  tab_f <- setNames(cbind(tab[-1,9:15], 'F'), nms)
  dat <- rbind(tab_m, tab_f)

  dat <- filter(dat, x != "")
  # Failed to skip lines when ingesting table
  dat <- filter(dat, !grepl("Year of Birth", x))
  dat[-8] <- lapply(dat[-8], function (x) {zapsmall(readr::parse_number(x))})

  dat$year <- year
  dat
}

years <- seq(1900, 2020, by = 10)
lifetables <- tibble::as_tibble(bind_rows(lapply(years, get_lifetables))) %>%
  arrange(year, sex, x)
readr::write_csv(lifetables[1:nrow(lifetables) %% 100 == 0,], "data-raw/lifetables_sample.csv")
usethis::use_data(lifetables, compress = "xz", overwrite = T)
