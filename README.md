# babynames

[![Travis-CI Build Status](https://travis-ci.org/hadley/babynames.svg?branch=master)](https://travis-ci.org/hadley/babynames)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/babynames)](https://cran.r-project.org/package=babynames)

This package contains three datasets provided by the USA social security administration:

* `babynames`: For each year from 1880 to 2020, the number of children of 
  each sex given each name. All names with more than 5 uses are given.
  (Source: http://www.ssa.gov/oact/babynames/limits.html)

* `applicants`: The number of applicants for social security numbers (SSN) for
  each year for each sex. 
  (Source: http://www.ssa.gov/oact/babynames/numberUSbirths.html)

* `lifetables`: Cohort life tables data
  (Source: http://www.ssa.gov/oact/NOTES/as120/LifeTables_Body.html)

It also includes the following data set from the US Census:

* `births`: Number of live births by year, up to 2020.
  (Source: an Excel spreadsheet from the Census that has since been removed
  from their website and https://www.cdc.gov/nchs/data/nvsr/nvsr66/nvsr66_01.pdf. 
  Data for 2017-2020 obtained from https://www.cdc.gov/nchs/data/nvsr/nvsr68/nvsr68_13-508.pdf, 
  https://www.cdc.gov/nchs/data/nvsr/nvsr70/nvsr70-02-508.pdf and
  https://www.cdc.gov/nchs/data/nvsr/nvsr70/nvsr70-17.pdf.)

## Installation

```R
# Install the released version from CRAN
install.packages("babynames")

# Install the development version from GitHub
devtools::install_github("hadley/babynames")
```

## Code of Conduct

Please note that the babynames project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
