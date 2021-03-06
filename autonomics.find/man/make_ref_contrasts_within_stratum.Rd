% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contrast_subgroups.R
\name{make_ref_contrasts_within_stratum}
\alias{make_ref_contrasts_within_stratum}
\title{Make ref contrasts within stratum}
\usage{
make_ref_contrasts_within_stratum(
  dt,
  sep,
  component = 1,
  ref_levels = vapply(dt, magrittr::extract, character(1), 1)
)
}
\arguments{
\item{dt}{subgroup data.table for single stratum}

\item{sep}{subgroup separator}

\item{component}{subgroup component for which to define contrasts}

\item{ref_levels}{reference levels (character vector)}
}
\description{
Make reference contrasts for selected variable within stratum of other variables
}
\examples{
require(magrittr) 

# STEMCELL DIFFERENTIATION
if (require(autonomics.data)){
   object <- autonomics.data::stemdiff.proteinratios
   dt  <- object \%>\% autonomics.import::split_values(keep = FALSE)
   sep <- object \%>\% autonomics.import::guess_sep()
   autonomics.find::make_ref_contrasts_within_stratum(dt, sep, 1)
   
}

if (require(subramanian.2016)){
   dt  <- subramanian.2016::metabolon \%>\% autonomics.import::split_values(keep = FALSE)
   sep <- subramanian.2016::metabolon \%>\% autonomics.import::guess_sep()
   dt \%<>\% magrittr::extract(x2 == 'w08')
   autonomics.find::make_ref_contrasts_within_stratum(dt, sep) \%>\% print()
}
}
