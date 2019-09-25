# UMAP function
Umap <- function(matrix, norm, center, transpose, n_neighbors, min_dist, n_compo) {
  # matrix is gene x cell matrix
  # norm, center and transpose are booleans
  if (transpose == T) {
    matrix <- (matrix)
  }
  if (norm == T) {
    matrix <- apply(matrix,2,function(x) x/var(x))
  }
  if (center == T) {
    matrix <- apply(matrix,2,function(x) x-mean(x))
  }
  library(umap)
  umap.config <- umap.defaults
  umap.config$n_neighbors <- n_neighbors
  #umap.config$min_dist <- min_dist
  umap.config$n_components <- n_compo
  umap <- umap(t(matrix), config = umap.config, method = "naive")
  return(umap)
}

# test the custom glmPCA function on Guo data
matrix <- read.table("Guo_data_prePCA.txt", header=T)
UMAP <- Umap(matrix,norm=F,center=F,transpose=F, n_neighbors = 20, n_compo = 20)

# Save obj
saveRDS(UMAP,file="UMAP.rds")