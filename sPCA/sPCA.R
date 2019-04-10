# sparse PCA
# let's do a sparse PCA and find the optimal number of sparse PCs

# Write the custom function to run sPCA on a gene x cell matrix
library(nsprcomp)
sPCA <- function(matrix, norm, center, transpose) {
  # matrix is a gene x cell matrix
  # norm, center and transpose are booleans
  if (transpose == T) {
    matrix <- t(matrix)
  }
  if (norm == T) {
    matrix <- apply(matrix,2,function(x) x/var(x))
  }
  if (center == T) {
    matrix <- apply(matrix,2,function(x) x-mean(x))

  }
  spca <- nsprcomp(t(matrix),center=F)
  return(spca)
}

# For the optimal nb of PCs I can do
# Jackstraw

# Screeplot
#av <- peav(t(matrix),spca$rotation,center=F)
#plot(av)

# Manually looking at the shapes of the plots in the sPCA space
