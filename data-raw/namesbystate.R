library(dplyr)
library(XML)
library(reshape2)

load("data/applicants.rdata")

if (!file.exists("data-raw/namesbystate")) {
  tmp <- tempfile(fileext = ".zip")
  download.file("http://www.ssa.gov/oact/babynames/state/namesbystate.zip", tmp, quiet = TRUE)
  unzip(tmp, exdir = "data-raw/namesbystate")
  unlink(tmp)
}

# From: http://www.ssa.gov/oact/babynames/limits.html
all <- dir("data-raw/namesbystate", "\\.TXT$", full.names = TRUE)

data <- lapply(all, read.csv,
               colClasses = c("character", "character", "integer", "character", "integer"),
               header = FALSE
)

one <- dplyr::rbind_all(data)
names(one) <- c("state", "sex", "year", "name", "n")
  
# Add full state names
library(XML)
doc <- readHTMLTable("http://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations", 
                     stringsAsFactors = FALSE, header = TRUE)[[1]]
# Use the ANSI[2] abbreviation 
abbrevs <- setNames(doc[-c(1:2),], as.character(t(doc[2,])))[,c("Name", "ANSI[2]")]
abbrevs$Name <- tolower(abbrevs$Name)
names(abbrevs) <- c("region", "state")

namesbystate <- one %>%
  tbl_df() %>%
  arrange(year, state, desc(n)) %>%
  left_join(applicants) %>%
  mutate(prop = n / n_all) %>%
  select(-n_all) %>%
  left_join(abbrevs) %>%
  select(-state)



#idx <- one %>% select(state) %>% unique %>% 
#        extract(,1) %>% match(abbrevs[,"ANSI[2]"])

save(namesbystate, file = "data/namesbystate.rdata", compress = "xz")
  
# The SSA "restricts our list of names to those with at least 5 occurrences".
# For this reason, I believe some names were removed going from the national level to the state level
# The code below is designed to test that hypothesis.

# one %>%
#   tbl_df() %>%
#   filter(year == 1910) %>%
#   summarise(n2 = sum(n))
# data(names)
# babynames %>% group_by(year, sex) %>% summarise(n_all = sum(n))
# data(applicants)
# applicants %>% filter(year == 1910)
