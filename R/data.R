#' Baby names.
#'
#' Full baby name data provided by the SSA. This includes all names with at
#' least 5 uses.
#'
#' @format A data frame with five variables: \code{year}, \code{sex},
#'   \code{name}, \code{n} and \code{prop} (\code{n} divided by total number
#'   of applicants in that year).
"babynames"

#' Applicants.
#'
#' The SSA baby names data comes from social security number (SSN) applications.
#' SSA cards were first issued in 1936, but were only needed for people with
#' an income. In 1986, the law changed effectively requiring all children to
#' get an SSN at birth.
#'
#' @format A data frame with 3 variables: \code{year}, \code{sex} and
#'   \code{n_all}
"applicants"
