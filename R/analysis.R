#'
#'
#'
#'
#'

#check whether ID in sig sites is in ID of methylation data
library(cluster)
library(dplyr)
library(ggplot2)
library(ConsensusClusterPlus)

methylationData <- read.csv("/Users/shameel/Documents/oncocluster/oncoCluster/data/methylationData.csv")
significantSites <- read.csv("/Users/shameel/Documents/oncocluster/oncoCluster/data/significantSites.csv")

significantSites$ID
methylationData$ID

# Subsets the methylation data, only significant methylation sites selected
methylationData <- dplyr::filter(methylationData, ID %in% significantSites$ID)

summary(methylationData)
rownames(methylationData)

# Convert the first column into row names for the matrix
methylationData <- data.frame(methylationData, row.names = 1)

methylationDataMatrix <- as.matrix(methylationData)
# Use the consensusClusterPlus Package to do the clustering analysis

# https://www.bioconductor.org/packages/devel/bioc/vignettes/ConsensusClusterPlus/inst/doc/ConsensusClusterPlus.pdf
# title = tempdir()
# results = ConsensusClusterPlus::ConsensusClusterPlus(methylationDataMatrix, maxK = 3,
#                                                     reps = 15, pItem = 0.8,
#                                                     pFeature = 1, title = title,
#                                                     clusterAlg = "hc",
#                                                     distance = "pearson",
#                                                     seed = 1234, plot = "png")



