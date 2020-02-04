# UMAP
# let's do a UMAP

# load the data
matrix <- read.table(paste0(path,obj_to_load), header=T)
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]

# Check the distribution of nGene
ngene <- apply(matrix,2,function(x) sum(x!=0))
hist(ngene,breaks=1000)

# Check the distribution of percentage of mitotic genes
mitogenes <- grep(pattern="^MT",x=rownames(matrix),value=T)
mitopercent <- colSums(matrix[mitogenes, ])/colSums(matrix)
hist(mitopercent,breaks=1000)

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
