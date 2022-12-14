% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis.R
\name{clusterAnalysis}
\alias{clusterAnalysis}
\title{Applies K-means Clustering to DNA Methylation Data}
\usage{
clusterAnalysis(dnaMethylationData, dnaMethylationSites)
}
\arguments{
\item{dnaMethylationData}{A matrix which contains DNA Methylation beta
values of various methylation sites from several different samples.}

\item{dnaMethylationSites}{A matrix that contains the DNA methylation sites
which have been validated as being significant for the purposes of
clustering.}
}
\value{
Returns an object of class kmeans, it is a list with the results.
\itemize{
\item cluster - Vector of integers indicating the cluster
\item centers - Matric of cluster centers.
\item totss - Total sum of squares.
\item withinss - Vector of within-cluster sum of squares.
\item betweenss - The between-cluster sum of squares.
\item size Number of points in each cluster.
\item iter Number of iterations.
\item ifault integer: indicator of a possible fault.
}
}
\description{
A function that does k-means clustering on DNA methylation Data taken from
multiple samples given the significant methylation sites.
}
\examples{
# Example 1:
# Using methylationData and significantSites Data available with package
dim(methylationData)
dim(significantSites)

# Do clustering Analysis
results <- clusterAnalysis(dnaMethylationData = methylationData, dnaMethylationSites = significantSites)
results$cluster

}
\references{
Wickham H, François R, Henry L, Müller K (2022). \emph{dplyr: A Grammar of Data
Manipulation}. R package version 1.0.10, \url{https://CRAN.R-project.org/package=dplyr}.

R Core Team (2022). R: A language and environment for statistical computing. R
Foundation for Statistical Computing, Vienna, Austria. URL
https://www.R-project.org/.

Li, T., Chen, X., Gu, M. et al. Identification of the subtypes of gastric
cancer based on DNA methylation and the prediction of prognosis.
Clin Epigenet 12, 161 (2020). https://doi.org/10.1186/s13148-020-00940-3
}
