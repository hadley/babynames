library(xml2)
library(rvest)
library(tidyr)
library(dplyr)
library(usethis)

get_lifetables <- function(year){
  url <- "http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7_%s.html"
  tab <- xml2::read_html("http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7_1900.html") %>% rvest::html_table(fill = TRUE) %>% {.[[2]]}
  nms <- c("x", "qx", "lx", "dx", "Lx", "Tx", "ex", "sex")
  tab_m <- setNames(cbind(tab[-1,1:7], 'M'), nms)
  tab_f <- setNames(cbind(tab[-1,9:15], 'F'), nms)
  dat <- rbind(tab_m, tab_f)

  dat <- filter(dat, x != "")
  dat[-8] <- lapply(dat[-8], readr::parse_number)
  dat <- filter(dat, x != year)
  dat$year <- year
  dat
}

years <- seq(1900, 2017, by = 10)
lifetables <- tbl_df(bind_rows(lapply(years, get_lifetables)))
usethis::use_data(lifetables, compress = "xz", overwrite = T)
