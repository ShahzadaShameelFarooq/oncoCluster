#' Applies K-means Clustering to DNA Methylation Data
#'
#' A function that does k-means clustering on DNA methylation Data taken from
#' multiple samples given the significant methylation sites.
#'
#' @param dnaMethylationData A matrix which contains DNA Methylation beta
#'     values of various methylation sites from several different samples.
#' @param dnaMethylationSites A matrix that contains the DNA methylation sites
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
#' @examples
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
  results <- kmeans(dnaMethylationData, centers = 3, nstart = 20)

  # Reset the seed
  set.seed(NULL)

  return(results)

}

#' Applies Clustering to DNA Methylation Data using the mclust package
#'
#' A function that does clustering, using mclust package, on DNA methylation
#' Data taken from  multiple samples given the significant methylation sites.
#'
#' @param dnaMethylationData A matrix which contains DNA Methylation beta
#'     values of various methylation sites from several different samples.
#' @param dnaMethylationSites A matrix that contains the DNA methylation sites
#'     which have been validated as being significant for the purposes of
#'     clustering. These are to be generated using cox regression analysis.
#'
#' @return Returns a list with the results.
#' \itemize{
#'    \item call - The matched call.
#'    \item data - Input data matrix.
#'    \item modelName - Character string denoting the model.
#'    \item n - Number of observations in data.
#'    \item d - dimension of the data.
#'    \item G - Optimal number of mixture components.
#'    \item BIC - All BIC values.
#'    \item loglik -  log-likelihood corresponding to the optimal BIC.
#'    \item df - The number of estimated parameters.
#'    \item bic - BIC value of the selected model.
#'    \item icl - ICL value of the selected model.
#'    \item hypvol - The hypervolume parameter.
#'    \item parameters - A list with the following: pro, mean and variance.
#'    \item z - A matrix with probabilities.
#'    \item classification - The classification corresponding to z.
#'    \item uncertainty - The uncertainty.
#' }
#'
#' @examples
#' # Example 1:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' results <- clusterAnalysisTwo(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#' results$classification
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
#'Scrucca L., Fop M., Murphy T. B. and Raftery A. E. (2016) mclust 5:
#'clustering, classification and density estimation using Gaussian finite
#'mixture models The R Journal 8/1, pp. 289-317
#'
#' @export
#' @import dplyr
#' @import mclust
clusterAnalysisTwo <- function(dnaMethylationData, dnaMethylationSites){

  # Select the significant features from the data
  dnaMethylationData <- dplyr::filter(dnaMethylationData,
                                      ID %in% dnaMethylationSites$ID)

  # Convert the first column into row names for the matrix
  dnaMethylationData <- data.frame(dnaMethylationData, row.names = 1)

  # Set a seed so that results are reproducible
  set.seed(1234)

  dnaMethylationData <- t(dnaMethylationData)

  # use Mclust from mclust package to cluster
  results <- mclust::Mclust(dnaMethylationData, 3)

  return(results)
}

#' Compares the results of the two Clustering functions
#'
#' A function that compares the results of clusterAnalysis and
#' clusterAnalysisTwo by looking at the samples clustered in the maximum cluster
#' by both functions and getting the difference in the clusters.
#'
#' @param clusterAnalysisRes A kmeans object, essentially a list with the
#'     results from the clusterAnalysis function.
#' @param clusterAnalysisTwoRes A list with the results from the
#'     clusterAnalysisTwo function.
#'
#' @return Returns a character vector of which contains the difference between
#'     the two maximum clusters obtained from the clusterAnalysis and
#'     clusterAnalysisTwo.
#'
#' @examples
#' # Example 1:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' resultsOne <- clusterAnalysis(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#' resultsTwo <- clusterAnalysisTwo(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#'
#' # Do cluster comparison
#'clusterComparison(clusterAnalysisRes = resultsOne, clusterAnalysisTwoRes = resultsTwo)
#'
#' @references
#'Wickham H, François R, Henry L, Müller K (2022). _dplyr: A Grammar of Data
#'Manipulation_. R package version 1.0.10, <https://CRAN.R-project.org/package=dplyr>.
#'
#'R Core Team (2022). R: A language and environment for statistical computing. R
#'Foundation for Statistical Computing, Vienna, Austria. URL
#'https://www.R-project.org/.
#'
#' @export
#' @import dplyr
clusterComparison <- function(clusterAnalysisRes, clusterAnalysisTwoRes){

  # Input checks

  if(is.list(clusterAnalysisRes) == "FALSE"){
    stop("Invalid input, must provide list from clusterAnalysis function.")
  }

  if(is.list(clusterAnalysisTwoRes) == "FALSE"){
    stop("Invalid input, must provide list from clusterAnalysis function.")
  }

  # create a matrix from the cluster part of clusterAnalysisRes
  if(!(is.null(clusterAnalysisRes$cluster))){
      matrixOne <- as.matrix(table(clusterAnalysisRes$cluster))
  }else{
    stop("Invalid results input into clusterAnalysisRes.")
  }

  if(!(is.null(clusterAnalysisTwoRes$classification))){
    matrixTwo <- as.matrix(table(clusterAnalysisTwoRes$classification))
  }else{
    stop("Invalid results input into clusterAnalysisTwoRes.")
  }

  # Get the cluster with the maximum size for clusterAnalysisRes
  maxClusterOne <- which(matrixOne == max(matrixOne))

  # Get the cluster with the maximum size for clusterAnalysisTwoRes
  maxClusterTwo <- which(matrixTwo == max(matrixTwo))

  # create a matrix which has the samples as rowname and the column specifies
  # which cluster for clusterAnalysisRes
  infoOne <- as.matrix(clusterAnalysisRes$cluster)

  # create a matrix which has the samples as rowname and the column specifies
  # which cluster for clusterAnalysisTwoRes
  infoTwo <- as.matrix(clusterAnalysisTwoRes$classification)

  # All the samples which cluster to the largest cluster for clusterAnalysisRes
  samplesOneMax <- rownames(infoOne)[which(infoOne == maxClusterOne)]

  # All the samples which cluster to the largest cluster for
  # clusterAnalysisTwoRes
  samplesTwoMax <- rownames(infoTwo)[which(infoTwo == maxClusterTwo)]

  # Get the sample(s) which was/were different when comparing the two max
  # clusters
  if(length(samplesOneMax) >= length(samplesTwoMax)){

    difference <- dplyr::setdiff(samplesOneMax, samplesTwoMax)
  }else{
    difference <- dplyr::setdiff(samplesTwoMax, samplesOneMax)
  }

  if(identical(difference, character(0))){
    d <- character()
    return(d)
  }else{
    return(difference)
  }

}

# [END]
