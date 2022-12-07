test_that("clusterAnalysis Returns a List of 9", {

  res <- clusterAnalysis(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_type(res, "list")
  expect_length(res, 9)
  expect_s3_class(res, "kmeans")


})

test_that("clusterAnalysis Returns 3 clusters",{

  res <- clusterAnalysis(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_equal(nrow(as.matrix(table(res$cluster))), 3)
  expect_equal(as.integer(table(res$cluster)[1]), 1)
  expect_equal(as.integer(table(res$cluster)[2]), 5)
  expect_equal(as.integer(table(res$cluster)[3]), 1)

})

test_that("Resulting list types are correct for clusterAnalysis",{
  res <- clusterAnalysis(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_type(typeof(res$cluster), "character")
  expect_type(typeof(res$centers), "character")
  expect_type(typeof(res$totss), "character")
  expect_type(typeof(res$withinss), "character")
  expect_type(typeof(res$betweenss), "character")
  expect_type(typeof(res$size), "character")
  expect_type(typeof(res$iter), "character")
  expect_type(typeof(res$ifault), "character")

})

test_that("clusterAnalysisTwo Returns a List of 16", {

  res <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_type(res, "list")
  expect_length(res, 16)
  expect_s3_class(res, "Mclust")


})

test_that("clusterAnalysis Returns 3 clusters",{

  res <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_equal(nrow(as.matrix(table(res$classification))), 3)
  expect_equal(as.integer(table(res$classification)[1]), 4)
  expect_equal(as.integer(table(res$classification)[2]), 2)
  expect_equal(as.integer(table(res$classification)[3]), 1)

})

test_that("Resulting list types are correct for clusterAnalysisTwo",{
  res <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                         dnaMethylationSites = significantSites)

  expect_type(typeof(res$classification), "character")
  expect_type(typeof(res$call), "character")
  expect_type(typeof(res$data), "character")
  expect_type(typeof(res$modelName), "character")
  expect_type(typeof(res$n), "character")
  expect_type(typeof(res$d), "character")
  expect_type(typeof(res$G), "character")
  expect_type(typeof(res$BIC), "character")
  expect_type(typeof(res$loglik), "character")
  expect_type(typeof(res$df), "character")
  expect_type(typeof(res$bic), "character")
  expect_type(typeof(res$icl), "character")
  expect_type(typeof(res$hypvol), "character")
  expect_type(typeof(res$parameters), "character")
  expect_type(typeof(res$z), "character")
  expect_type(typeof(res$uncertainty), "character")

})

test_that("clusterComparison throws error on invalid input",{
  resOne <- clusterAnalysis(dnaMethylationData = methylationData,
                            dnaMethylationSites = significantSites)

  resTwo <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                            dnaMethylationSites = significantSites)


  # Wrong input
  expect_error(fRes <- clusterComparison(clusterAnalysisRes = 1,
                                         clusterAnalysisTwoRes = 2))

  # Mixing up the input
  expect_error(fRes <- clusterComparison(clusterAnalysisRes = resTwo,
                                         clusterAnalysisTwoRes = resOne))

})

test_that("clusterComparison returns a character",{
  resOne <- clusterAnalysis(dnaMethylationData = methylationData,
                            dnaMethylationSites = significantSites)

  resTwo <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                               dnaMethylationSites = significantSites)



  fRes <- clusterComparison(clusterAnalysisRes = resOne,
                                         clusterAnalysisTwoRes = resTwo)

  expect_type(fRes, "character")

})

test_that("clusterComparison returns the correct output",{
  resOne <- clusterAnalysis(dnaMethylationData = methylationData,
                            dnaMethylationSites = significantSites)

  resTwo <- clusterAnalysisTwo(dnaMethylationData = methylationData,
                               dnaMethylationSites = significantSites)

  fRes <- clusterComparison(clusterAnalysisRes = resOne,
                            clusterAnalysisTwoRes = resTwo)

  expect_equal(fRes, "TCGA.BR.4201.01A")
})


# [END]
