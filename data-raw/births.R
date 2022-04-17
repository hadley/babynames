library(tidyverse)
library(readxl)
library(usethis)

# 1909 - 2001
# Source: https://www2.census.gov/library/publications/2004/compendia/statab/123ed/hist/02HS0013.xls
if (!file.exists("data-raw/02HS0013.xls")) {
  download.file("https://www2.census.gov/library/publications/2004/compendia/statab/123ed/hist/02HS0013.xls", "data-raw/02HS0013.xls")
}

raw <- readxl::read_excel('data-raw/02HS0013.xls',
  range = "A16:B117",
  col_names = FALSE,
  na = "(NA)"
)
## define columns to avoid changing behavior of read_excel
colnames(raw) <- c("x1", "x2")
births <- raw %>%
  transmute(
    year = parse_integer(x1),
    births = x2 * 1e3) %>%
  filter(!is.na(births))

# 2002 - 2012 Manually extracted from
# http://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_09.pdf, page 50 (Table 21)
# 2002 - 2015 manually extracted from
# https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf
# 2016 - 2017 manually extracted from
# https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_08-508.pdf, page 12 (Table 1)
# 2017-2018 from https://www.cdc.gov/nchs/data/nvsr/nvsr68/nvsr68_13-508.pdf
## 2018-2019 from https://www.cdc.gov/nchs/data/nvsr/nvsr70/nvsr70-02-508.pdf
## 2020 data from https://www.cdc.gov/nchs/data/nvsr/nvsr70/nvsr70-17.pdf
recent <- tribble(
  ~year, ~births,
  2002,  4021726,
  2003,  4089950,
  2004,  4112052,
  2005,  4138349,
  2006,  4265555,
  2007,  4316233,
  2008,  4247694,
  2009,  4130665,
  2010,  3999386,
  2011,  3953590,
  2012,  3952841,
  2013,  3932181,
  2014,  3988076,
  2015,  3978497,
  2016,  3945875,
  2017,  3855500,
  2018,  3791712,
  2019,  3747540,
  2020,  3613647
)

births <- births %>%
  bind_rows(recent) %>%
  mutate(
    year = as.integer(year),
    births = as.integer(births)
  ) %>%
  arrange(year)

write_csv(births, "data-raw/births.csv")
usethis::use_data(births, overwrite = TRUE, compress = 'xz')
