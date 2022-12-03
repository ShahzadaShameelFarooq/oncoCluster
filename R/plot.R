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


# [END]
