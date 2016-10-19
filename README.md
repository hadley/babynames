# babynames

[![Travis-CI Build Status](https://travis-ci.org/hadley/babynames.svg?branch=master)](https://travis-ci.org/hadley/babynames)

This package contains three datasets provided by the USA social security administration:

* `babynames`: For each year from 1880 to 2015, the number of children of 
  each sex given each name. All names with more than 5 uses are given.
  (Source: http://www.ssa.gov/oact/babynames/limits.html)

* `applicants`: The number of applicants for social security numbers (SSN) for
  each year for each sex. 
  (Source: http://www.ssa.gov/oact/babynames/numberUSbirths.html)

* `lifetables`: Cohort life tables data
  (Source: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Body.html)

It also includes the following data set from the US Census:

* `births`: Number of live births by year, up to 2014.
  (Source: http://www.census.gov/statab/hist/02HS0013.xls and
  http://www.cdc.gov/nchs/data/nvsr/nvsr62/nvsr62_09.pdf)

Install it from github with:
  
```{r}
devtools::install_github("hadley/babynames")
```
