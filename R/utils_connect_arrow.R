#' connect_arrow
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
utils_connect_arrow <- function(datamode, spatres) {

  if (datamode=="Period"){

    data <- switch(spatres,
                   "City"    = arrow::open_dataset(sources = system.file("extdata/city_period", package = "hipmapp"), partitioning = "agegroup"),
                   "Country" = arrow::open_dataset(sources = system.file("extdata/country_period", package = "hipmapp"), partitioning = "agegroup"),
                   "Region"  = arrow::open_dataset(sources = system.file("extdata/region_period", package = "hipmapp"), partitioning = "agegroup"),
                   default   = NULL)

  } else {

    data <- switch(spatres,
                   "City"    = arrow::open_dataset(sources = system.file("extdata/city_level", package = "hipmapp"), partitioning = "agegroup"),
                   "Country" = arrow::open_dataset(sources = system.file("extdata/country_level", package = "hipmapp"), partitioning = "agegroup"),
                   "Region"  = arrow::open_dataset(sources = system.file("extdata/region_level", package = "hipmapp"), partitioning = "agegroup"),
                   default   = NULL)

  }

  return(data)

}
