# PCA
# let's do a PCA and find the optimal number of PCs

# Write the custom function to perform PCA on a gene x cell matrix
pca <- function(matrix, norm, center, transpose) {
  # matrix is a gene x cell matrix
  # norm, center and transpose are booleans
  if (norm == T) {
    matrix <- apply(matrix,2,function(x) x/var(x))
  }
  if (center == T) {
    matrix <- apply(matrix,2,function(x) x-mean(x))
  }
  if (transpose == T) {
    matrix <- t(matrix)
  }
  pca <- prcomp(t(matrix))
  return(pca)
}

# For the optimal nb of PCs I can do
# Jackstraw

# Screeplot

# Manually looking at the shapes of the plots in the PCA space
