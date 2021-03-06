% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zero_consistent_nas.R
\name{zero_to_na_if_not_all_zero}
\alias{zero_to_na_if_not_all_zero}
\title{NA inconsistent zeroes}
\usage{
zero_to_na_if_not_all_zero(
  object,
  no_zero = c("fail", "warn_passthrough", "passthrough")[1]
)
}
\arguments{
\item{object}{SummarizedExperiment}

\item{no_zero}{\code{\link{character}} defining how to react of there are no \code{0}s (zeros) present in the data set}
}
\value{
updated object

updated object
}
\description{
These functions allow to differentiate between two types of non-detects: consistent (which are 0 rather than NA) and
inconsistent (NA rather than 0). This distinction is required in LCMS platforms (proteomics and metabolomics),
where a high degree of inconsistent non-detects are generated due to platform stochasticity. It is not required in
transcriptomics platforms (RNAseq, qPCR, microarrays), where non-detecs arise due to low abundance rather than platform
stochasticity.
}
