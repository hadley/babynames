library(XML)
library(tidyr)
library(dplyr)

get_lifetables <- function(year){
  url <- "http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7_%s.html"
  tab <- readHTMLTable(sprintf(url, year), which = 2, skip = 2)
  nms <- c("x", "qx", "lx", "dx", "Lx", "Tx", "ex", "sex")
  tab_m <- setNames(cbind(tab[-1,1:7], 'M'), nms)
  tab_f <- setNames(cbind(tab[-1,9:15], 'F'), nms)
  dat <- rbind(tab_m, tab_f)

  dat <- filter(dat, x != "")
  dat[-8] <- lapply(dat[-8], extract_numeric)
  dat$year <- year
  dat
}

years <- seq(1900, 2010, by = 10)
lifetables <- tbl_df(rbind_all(lapply(years, get_lifetables)))
save(lifetables, file = 'data/lifetables.rdata', compress = 'xz')

# lifetables_2014 = subset(lifetables, x + year == 2014)
# all_years = seq(1900, 2010, 1)
# lifetable_2014 = plyr::ddply(lifetables_2014, "sex", function(d){
#   f = splinefun(d$year, d$lx, method = 'fmm')
#   data.frame(
#     year = all_years,
#     lx = f(all_years),
#     sex = d$sex[1]
#   )
# })
# save(lifetable_2014, file = 'data/lifetable_2014.rdata', compress = 'xz')
