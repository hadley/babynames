# Source: www.census.gov/statab/hist/02HS0013.xls
downloader::download(
  'http://www.census.gov/statab/hist/02HS0013.xls',
  'data-raw/02HS0013.xls'
)
library(gdata)
dat = read.xls(
  'data-raw/02HS0013.xls', sheet = 1, skip = 9,
  stringsAsFactors = F
)
keep = !grepl("^X\\.", names(dat))
total_births = dat[1:102,keep]

names(births) = c('year', 'total_births', 'total_deaths', 'infant_deaths', 'birth_rate', 'total_death_rate', 'infant_death_rate', 'maternal_death_rate', 'tuberculosis_death_rate', 'malignant_neoplasma_death_rate',
 'cardiovascular_renal_death_rate', 'influenza_pneumonia_death_rate',
 "vehicle_accident_death_rate"
)

births[] = sapply(births, function(x) as.numeric(sub(',', "", x)))


save(births, file = 'data/births.rdata', compress = 'xz')
