#' Applies K-means Clustering to DNA Methylation Data
#'
#' A function that does k-means clustering on DNA methylation Data taken from
#' multiple samples given the significant methylation sites.
#'
#' @param dnaMethylationData A csv file which contains DNA Methylation beta
#'     values of various methylation sites from several different samples.
#' @param dnaMethylationSites A csv file that contains the DNA methylation sites
#'     which have been validated as being significant for the purposes of
#'     clustering.
#'
#' @return Returns an object of class kmeans, it is a list with the results.
#' \itemize{
#'    \item cluster - Vector of integers indicating the cluster
#'    \item centers - Matric of cluster centers.
#'    \item totss - Total sum of squares.
#'    \item withinss - Vector of within-cluster sum of squares.
#'    \item betweenss - The between-cluster sum of squares.
#'    \item size Number of points in each cluster.
#'    \item iter Number of iterations.
#'    \item ifault integer: indicator of a possible fault.
#' }
#'
#' @example
#' # Example 1:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' results <- clusterAnalysis(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#' results$cluster
#'
#' @references
#'Wickham H, François R, Henry L, Müller K (2022). _dplyr: A Grammar of Data
#'Manipulation_. R package version 1.0.10, <https://CRAN.R-project.org/package=dplyr>.
#'
#'R Core Team (2022). R: A language and environment for statistical computing. R
#'Foundation for Statistical Computing, Vienna, Austria. URL
#'https://www.R-project.org/.
#'
#'Li, T., Chen, X., Gu, M. et al. Identification of the subtypes of gastric
#'cancer based on DNA methylation and the prediction of prognosis.
#'Clin Epigenet 12, 161 (2020). https://doi.org/10.1186/s13148-020-00940-3
#'
#' @export
#' @import dplyr
#' @import stats
clusterAnalysis <- function(dnaMethylationData, dnaMethylationSites){

  # Select the significant features from the data
  dnaMethylationData <- dplyr::filter(dnaMethylationData,
                                      ID %in% dnaMethylationSites$ID)

  # Convert the first column into row names for the matrix
  dnaMethylationData <- data.frame(dnaMethylationData, row.names = 1)

  # Set a seed so that results are reproducible
  set.seed(1234)

  dnaMethylationData <- t(dnaMethylationData)

  # Implement the kmeans algorithm
  results <- stats::kmeans(dnaMethylationData, centers = 3, nstart = 20)

  # Reset the seed
  set.seed(NULL)

  return(results)

}


# [END]
