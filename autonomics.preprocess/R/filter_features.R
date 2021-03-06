#' Keep features that are non-zero, non-NA, and non-NaN for some sample
#' @param object  SummarizedExperiment
#' @param verbose logical
#' @return  filtered eSet
#' @importFrom magrittr %>%
#' @export
filter_features_nonzero_in_some_sample <- function(object, verbose = TRUE){
   # . != 0 needed due to stupid behaviour of rowAnys
   # https://github.com/HenrikBengtsson/matrixStats/issues/89
   selector <- matrixStats::rowAnys(autonomics.import::exprs(object) != 0, na.rm = TRUE)
   if (verbose) autonomics.support::cmessage('\t\tRetain %d/%d features: non-zero, non-NA, and non-NaN for some sample',
                                              sum(selector), length(selector))
   object %<>% magrittr::extract(selector, )
   if (!is.null(autonomics.import::analysis(object))) {
      autonomics.import::analysis(object)$nfeatures %<>%
         c(structure(
            sum(selector),
            names = "non-zero, non-NA, and non-NaN for some sample"))
   }
   object
}

#' Keep features that are non zero (and non-NA) for two samples in some subgroup
#' @param   object  eSet
#' @return  filtered eSet
#' @importFrom  magrittr  %>%
#' @export
filter_features_nonzero_for_two_samples_in_some_subgroup <- function(object){
   x <- t(autonomics.import::exprs(object))
   n_nonzero_per_subgroup <- stats::aggregate(x, by = list(subgroup = object$subgroup), FUN = function(y){sum(y != 0, na.rm = TRUE)})
   selector <- n_nonzero_per_subgroup %>% magrittr::extract(, -1) %>% magrittr::is_weakly_greater_than(2) %>% matrixStats::colAnys()
   autonomics.support::cmessage('\t\tRetain %d/%d features: non-zero (and non-NA) for at least two samples in some subgroup', sum(selector), length(selector))
   object %<>% magrittr::extract(selector, )
   if (!is.null(autonomics.import::analysis(object))) {
      autonomics.import::analysis(object)$nfeatures %<>%
         c(structure(
            sum(selector),
            names = "non-zero and non-NA for at least two samples in some subgroup"))
   }
   object
}



#' Keep features that are available in all samples
#' @param object SummarizedExperiment, eSet, or EList
#' @return updated object
#' @examples
#' require(magrittr)
#' if (require(autonomics.data)){
#'    object <- autonomics.data::glutaminase
#'    object %>% autonomics.preprocess::is_available_in_all_samples()
#'    object %>% autonomics.preprocess::filter_features_available_in_all_samples()
#' }
#' @importFrom magrittr %>%
#' @export
is_available_in_all_samples <- function(object){
   object %>% autonomics.import::exprs() %>% is.na() %>% magrittr::not() %>% matrixStats::rowAlls()
}


#' @rdname is_available_in_all_samples
#' @importFrom magrittr %>%
#' @export
filter_features_available_in_all_samples <- function(object){

   # Restrict to available values
   selector <- object %>% is_available_in_all_samples()
   autonomics.support::cmessage('\t\tUse %d/%d features with available value for each sample', sum(selector), length(selector))
   object %<>% magrittr::extract(selector, )
   if (!is.null(autonomics.import::analysis(object))) {
      autonomics.import::analysis(object)$nfeatures %<>%
         c(structure(
            sum(selector),
            names = "available value for each sample"))
   }
   object
}



#===========

