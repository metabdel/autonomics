% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/defaults.R
\name{default_group_var}
\alias{default_group_var}
\title{Default group var}
\usage{
default_group_var(object)
}
\arguments{
\item{object}{SummarizedExperiment}
}
\value{
default value of group_var
}
\description{
Default group var
}
\examples{
if (require(autonomics.data)){
   require(magrittr)

   # STEM CELL COMPARISON
   autonomics.data::stemcomp.proteinratios \%>\% default_group_var()

   # GLUTAMINASE
   autonomics.data::glutaminase            \%>\% default_group_var()
}
}
