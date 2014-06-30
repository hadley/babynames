library(gdata)
library(dplyr)
library(tidyr)

# 1909 - 2001
# Source: www.census.gov/statab/hist/02HS0013.xls
raw <- read.csv('data-raw/02HS0013.csv', skip = 15, stringsAsFactors = FALSE, header = FALSE)
births <- raw %>%
  tbl_df() %>%
  select(year = V1, births = V2) %>%
  mutate(births = extract_numeric(births) * 1e3, year = extract_numeric(year)) %>%
  filter(!is.na(births), !is.na(year))

# 2002 - 2012 Manually extracted from
# http://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_09.pdf, page 49
recent <- data.frame(
  year = 2002:2012,
  births = c(4021726, 4089950, 4112052, 4138349, 4265555, 4316233, 4247694,
    4130665, 3999386, 3953590, 3952841)
)

births <- births %>% rbind(recent) %>% mutate(year = as.integer(year))

save(births, file = 'data/births.rdata', compress = 'xz')
