% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_has_is.R
\name{contains_prepro}
\alias{contains_prepro}
\title{Does object contain prepro?}
\usage{
contains_prepro(object)
}
\arguments{
\item{object}{SummarizedExperiment}
}
\value{
logical
}
\description{
Does object contain preprocessing info?
}
\examples{
require(magrittr)
if (require(autonomics.data)){
   autonomics.data::stemcomp.proteinratios \%>\% contains_prepro()
}
}
