#' Adds strata to AR1.0 data
#' @description
#' Adds a column of strata to AR1.0 data
#' @param x
#' A data.frame containing AR1.0 data with a
#' column PROT indicating protected status and a 
#' column HABITAT_CD indicating the habitat
#' @param region
#' A string of the region the AR1.0 data is collected from:
#' FLA KEYS, SEFCRI, or DRY TORT
#' @return 
#' A data.frame with the original AR2.0 data with
#' a STRAT column added containing the stratum to
#' which a record belongs
addStrata  <- function(x, region){
  ## Replace spaces in region argument with underscores
  s_region  <- gsub(' ','_',toupper(region));
  ## Switch how strata are calculated depending
  ## on region
  out  <- switch(s_region,
                 FLA_KEYS = addStrataFK(x),
                 DRY_TORT = addStrataDT(x),
                 SEFCRI = addStrataSF(x)
                 );
  return(out)
}