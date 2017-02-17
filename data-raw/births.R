library(dplyr)
library(tidyr)
library(readr)

# 1909 - 2001
# Source: www.census.gov/statab/hist/02HS0013.xls
raw <- read_csv('data-raw/02HS0013.csv', skip = 24, col_names = FALSE,
                n_max = 93)
births <- raw %>%
  tbl_df() %>%
  select(year = X1, births = X2) %>%
  mutate(births = parse_number(births) * 1e3, year = parse_number(year)) %>%
  filter(!is.na(births), !is.na(year))

# 2002 - 2015 manually extracted from
# https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf
recent <- data.frame(
  year = 2002:2015,
  births = c(4021726, 4089950, 4112052, 4138349, 4265555, 4316233, 4247694,
    4130665, 3999386, 3953590, 3952841, 3932181, 3988076, 3978497)
)

births <- births %>% rbind(recent) %>% mutate(year = as.integer(year))

save(births, file = 'data/births.rdata', compress = 'xz')
