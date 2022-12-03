#' Plot the cluster results
#'
#' A function that plots the results from the cluster results of either
#' clusterAnalysis or clusterAnalysisTwo
#'
#' @param dnaMethylationData A matrixwhich contains DNA Methylation beta
#'     values of various methylation sites from several different samples.
#' @param dnaMethylationSites A matrix that contains the DNA methylation sites
#'     which have been validated as being significant for the purposes of
#'     clustering. These are generated using cox regression analysis.
#' @param clusterResults A list which are the results from clusterAnalysis or
#'     clusterAnalysisTwo functions..
#'
#' @return Returns a cluster plot.
#'
#' @examples
#' # Example 1:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' results <- clusterAnalysis(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#'
#' clusterPlot(dnaMethylationData = methylationData, dnaMethylationSites = significantSites, clusterResults = results)
#'
#'# Example 2:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' results <- clusterAnalysisTwo(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#'
#' clusterPlot(dnaMethylationData = methylationData, dnaMethylationSites = significantSites, clusterResults = results)
#'
#' @references
#'Kassambara A, Mundt F (2020). _factoextra: Extract and Visualize the
#'Results of Multivariate Data Analyses_. R package version 1.0.7,
#'<https://CRAN.R-project.org/package=factoextra>.
#'
#' @export
#' @import factoextra
#' @import ggplot2
clusterPlot <- function(dnaMethylationData, dnaMethylationSites,
                        clusterResults){

  # Select the significant features from the data
  dnaMethylationData <- dplyr::filter(dnaMethylationData,
                                      ID %in% dnaMethylationSites$ID)

  # Convert the first column into row names for the matrix
  dnaMethylationData <- data.frame(dnaMethylationData, row.names = 1)

  dnaMethylationData <- t(dnaMethylationData)

  # Create the cluster plot
  plot <- factoextra::fviz_cluster(clusterResults, data = dnaMethylationData,
                           palette = c("#2E9FDF", "#00AFBB", "#E7B800"),
                           geom = "point",
                           ellipse.type = "convex",
                           ggtheme = ggplot2::theme_bw())

  # Return the plot
  return(plot)

}

#' Compare Cluster Results
#'
#' A function that plots the barplots from the results of both clusterAnalysis
#' and clusterAnalysisTwo
#'
#' @param clusterResults A list which are the results from clusterAnalysis
#' @param clusterResultsTwo A list which are the results from clusterAnalysisTwo
#'
#' @return Returns a figure with two barplots
#'
#' @examples
#' # Example 1:
#' # Using methylationData and significantSites Data available with package
#' dim(methylationData)
#' dim(significantSites)
#'
#' # Do clustering Analysis
#' results <- clusterAnalysis(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#' resultsTwo <- clusterAnalysisTwo(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
#'
#' # Use the function to compare the clusters
#' compareClusterPlot(clusterResults = results, clusterResultsTwo = resultsTwo)
#'
#' @references
#'R Core Team (2022). R: A language and environment for statistical computing. R Foundation for Statistical
#'Computing, Vienna, Austria. URL https://www.R-project.org/.
#' @export
compareClusterPlot <- function(clusterResults, clusterResultsTwo){
  # Input checks

  if(is.list(clusterResults) == "FALSE"){
    stop("Invalid input, must provide list from clusterAnalysis function.")
  }

  if(is.list(clusterResultsTwo) == "FALSE"){
    stop("Invalid input, must provide list from clusterAnalysisTwo function.")
  }

  if(!(is.null(clusterResults$cluster))){
    matrixOne <- as.matrix(table(clusterResults$cluster))
  }else{
    stop("Invalid results input into clusterAnalysisRes.")
  }

  if(!(is.null(clusterResultsTwo$classification))){
    matrixTwo <- as.matrix(table(clusterResultsTwo$classification))
  }else{
    stop("Invalid results input into clusterAnalysisTwoRes.")
  }

  resultsOne <- c(matrixOne[1,1], matrixOne[2,1], matrixOne[3,1])
  resultsTwo <- c(matrixTwo[1,1], matrixTwo[2,1], matrixTwo[3,1])
  data <- data.frame(resultsOne, resultsTwo)

  barplot(as.matrix(data),
          main="Multiple Bar Plots",

          # setting y label only
          # because x-label will be our
          # barplots name
          ylab="Count",

          # to plot the bars vertically
          beside=TRUE,
  )
}


# [END]
