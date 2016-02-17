# babynames

[![Travis-CI Build Status](https://travis-ci.org/hadley/babynames.svg?branch=master)](https://travis-ci.org/hadley/babynames)

This package contains two datasets provided by the USA social security administration:

* `babynames`: For each year from 1880 to 2013, the number of children of 
  each sex given each name. All names with more than 5 uses are given.
  (Source: http://www.ssa.gov/oact/babynames/limits.html)

* `applicants`: The number of applicants for social security numbers (SSN) for
  each year for each sex. 
  (Source: http://www.ssa.gov/oact/babynames/numberUSbirths.html)

Install it from github with:
  
```{r}
devtools::install_github("hadley/babynames")
```
