# babynames

[![Travis-CI Build Status](https://travis-ci.org/hadley/babynames.svg?branch=master)](https://travis-ci.org/hadley/babynames)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/babynames)](https://cran.r-project.org/package=babynames)

This package contains three datasets provided by the USA social security administration:

* `babynames`: For each year from 1880 to 2016, the number of children of
  each sex given each name. All names with more than 5 uses are given.
  (Source: http://www.ssa.gov/oact/babynames/limits.html)

* `applicants`: The number of applicants for social security numbers (SSN) for
  each year for each sex.
  (Source: http://www.ssa.gov/oact/babynames/numberUSbirths.html)

* `lifetables`: Cohort life tables data
  (Source: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Body.html)

It also includes the following data set from the US Census:

* `births`: Number of live births by year, up to 2015.
  (Source: an Excel spreadsheet from the Census that has since been removed
  from their website and https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf)

## Installation

```R
# Install the released version from CRAN
install.packages("babynames")

# Install the development version from GitHub
devtools::install_github("hadley/babynames")
```
