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

test_that("Resulting list types are correct",{
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

# [END]
