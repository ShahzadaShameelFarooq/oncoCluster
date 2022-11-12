
<!-- README.md is generated from README.Rmd. Please edit that file -->

# oncoCluster

<!-- badges: start -->
<!-- badges: end -->

## Description

oncoCluster is an R package used to identify cancer sub-types by using
various clustering algorithms and using single omics data as well as
integrating multi omics data. The package will allow for the user to
compare the clustering results from the different clustering algorithms.
Furthermore, it will allow the user to validate whether intergrating
data from various omics provides better results.

The `oncoCluster` package was developed using
`R version 4.2.1 (2022-06-23)`, `Platform: x86_64-apple-darwin17.0` and
`Running under: Mac OS 12.6`.

## Installation

You can install the development version of oncoCluster from
[GitHub](https://github.com/) with:

``` r
require("devtools)
devtools::install_github("ShahzadaShameelFarooq/oncoCluster", build_vignettes = TRUE)
library(oncoCluster)
```

To run the shinyApp: Under construction

## Overview

``` r
ls("package:oncoCluster")
data(package = "oncoCluster") 
browseVignettes("oncoCluster")
```

`oncoCluster` currently contains 1 function for analysis of the input
data and 1 function which provides a graphical output.

-   Analysis (1 function):

1.  Using DNA methylation data from different Breast Cancer tissue
    samples to identify sub-types.

-   Graphical Output

1.  The result from the Analysis function is used to get plot.

## Contributions

The author of the package is Shahzada Muhammad Shameel Farooq.

## References

## Acknowledgements

This package was developed as part of an assessment for 2022 BCB410H:
Applied Bioinformatics course at the University of Toronto, Toronto,
CANADA. oncoCluster welcomes issues, enhancement requests, and other
contributions. To submit an issue, use the GitHub issues.
