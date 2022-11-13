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

