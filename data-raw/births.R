library(tidyverse)

# 1909 - 2001
# Source: www.census.gov/statab/hist/02HS0013.xls
raw <- read_excel('data-raw/02HS0013.xls',
  range = "A16:B117",
  col_names = FALSE,
  na = "(NA)"
)
births <- raw %>%
  transmute(
    year = parse_integer(X__1),
    births = X__2 * 1e3) %>%
  filter(!is.na(births))

# 2002 - 2012 Manually extracted from
# http://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_09.pdf, page 50 (Table 21)
# 2002 - 2015 manually extracted from
# https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf

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
  2016,  3945875 # https://www.cdc.gov/nchs/data/nvsr/nvsr67/nvsr67_01.pdf, p.2 and throughout
)

births <- births %>%
  bind_rows(recent) %>%
  mutate(
    year = as.integer(year),
    births = as.integer(births)
  )

write_csv(births, "data-raw/births.csv")
devtools::use_data(births, overwrite = TRUE, compress = 'xz')
