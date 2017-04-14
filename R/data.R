#' Baby names.
#'
#' Full baby name data provided by the SSA. This includes all names with at
#' least 5 uses.
#'
#' @format A data frame with five variables: \code{year}, \code{sex},
#'   \code{name}, \code{n} and \code{prop} (\code{n} divided by total number
#'   of applicants in that year, which means proportions are of people of
#'   that gender with that name born in that year).
"babynames"

#' Applicants.
#'
#' The SSA baby names data comes from social security number (SSN) applications.
#' SSA cards were first issued in 1936, but were only needed for people with
#' an income. In 1986, the law changed effectively requiring all children to
#' get an SSN at birth.
#'
#' @format A data frame with 3 variables: \code{year}, \code{sex} and
#'   \code{applicants}
"applicants"

#' Lifetables
#'
#' Cohort life tables data as provided by SSA.
#'
#' @format A data frame with nine variables:
#' \describe{
#' \item{\code{x}}{age in years}
#' \item{\code{qx}}{probability of death at age \code{x}}
#' \item{\code{lx}}{number of survivors, of birth cohort of 100,000, at next integral age}
#' \item{\code{dx}}{number of deaths that would occur between integral ages}
#' \item{\code{Lx}}{Number of person-years lived between \code{x} and \code{x+1}}
#' \item{\code{Tx}}{Total number of person-years lived beyond age \code{x}}
#' \item{\code{ex}}{Average number of years of life remaining for members of cohort alive at age \code{x}}
#' \item{\code{sex}}{Sex}
#' \item{\code{year}}{Year}
#' }
#'
#' For further details, see \url{http://www.ssa.gov/oact/NOTES/as120/LifeTables_Body.html#wp1168594}
#'
"lifetables"

#' Births
#'
#' Live births data from census.gov.
#'
#' @format A data frame:
#' \describe{
#' \item{year}{Year}
#' \item{births}{Number of live births, rounded to nearest 1000}}
"births"
