# UMAP
# let's do a UMAP

# Write the custom function to do the UMAP on a gene x cell matrix
umap <- function(matrix, norm, center, transpose, n_neighbors, min_dist, n_compo) {
  # matrix is gene x cell matrix
  # norm, center and transpose are booleans
  if (transpose == T) {
    matrix <- (matrix)
  }
  if (norm = T) {
    matrix <- apply(matrix,2,function(x) x/var(x))
  }
  if (center = T) {
    matrix <- apply(matrix,2,function(x) x-mean(x))
  }
  library(umap)
  umap.config <- umap.defaults
  umap.config$n_neighbors <- n_neighbors
  umap.config$min_dist <- min_dist
  umap.config$n_components <- n_components
  umap <- umap(t(matrix), config = umap.config, method = "umap-learn")
  return(umap)
}
