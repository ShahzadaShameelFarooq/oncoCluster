# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

hello <- function() {
  print("Hello, world!")
}

# Data to be collected, each file has data from a single patient
# Each file will need to have dimensions changed
# Name of row will be the TCGA identifier
# Columns will be the Features
# Once the data has been combined
# We will choose only the significant features and drop the rest
# Next we will apply the clustering algorithm on the matrix

#'
#'
#'
#'
#'

#check whether ID in sig sites is in ID of methylation data
#library(cluster)
#library(dplyr)
#library(ggplot2)
#library(ConsensusClusterPlus)
#library(factoextra)

#methylationData <- read.csv("/Users/shameel/Documents/oncocluster/oncoCluster/data/methylationData.csv")
#significantSites <- read.csv("/Users/shameel/Documents/oncocluster/oncoCluster/data/significantSites.csv")

#significantSites$ID
#methylationData$ID

# Subsets the methylation data, only significant methylation sites selected
#methylationData <- dplyr::filter(methylationData, ID %in% significantSites$ID)

#summary(methylationData)
#rownames(methylationData)

# Convert the first column into row names for the matrix
#methylationData <- data.frame(methylationData, row.names = 1)

#methylationDataMatrix <- as.matrix(methylationData)
# Use the consensusClusterPlus Package to do the clustering analysis

# https://www.bioconductor.org/packages/devel/bioc/vignettes/ConsensusClusterPlus/inst/doc/ConsensusClusterPlus.pdf
# https://www.r-bloggers.com/2021/04/cluster-analysis-in-r/
# https://www.datacamp.com/tutorial/k-means-clustering-r
#title = tempdir()
#results = ConsensusClusterPlus::ConsensusClusterPlus(methylationDataMatrix, maxK = 3,
#                                                     reps = 15, pItem = 0.8,
#                                                     pFeature = 1, title = title,
#                                                     clusterAlg = "hc",
#                                                     distance = "pearson",
#                                                     seed = 1234, plot = NULL)
#
#
#set.seed(NULL)
#set.seed(1234)
#results2 <- kmeans(methylationData, centers = 3, nstart = 20)
#set.seed(NULL)
#results2$cluster
#table(results2$cluster)
#results2$centers
#factoextra::fviz_cluster(results2, data = methylationData,
#                         palette = c("#2E9FDF", "#00AFBB", "#E7B800"),
#                         geom = "point",
#                         ellipse.type = "convex",
#                         ggtheme = theme_bw())
#
#clusterFrequency <- as.matrix(table(results2$cluster))
#clusterFrequency <- matrix(c(clusterFrequency[1,1], clusterFrequency[2, 1], clusterFrequency[3, 1]),
#                           nrow = 1, ncol = 3)
#colnames(clusterFrequency) <- c("1", "2", "3")
#row.names(clusterFrequency) <- "Frequency"
#barplot(clusterFrequency, col = c("red", "green", "blue"))
#clusterFrequency


