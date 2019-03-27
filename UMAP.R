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

# Normalization
for (i in 1:ncol(matrix)) {
  matrix[,i] <- matrix[,i]/sum(matrix[,i])
}

# Centering
for (i in 1:ncol(matrix)) {
  matrix[,i] <- matrix[,i] - mean(matrix[,i])
}

# do the UMAP
library(umap)
umap.config <- umap.defaults
umap.config$n_neighbors <- 30
umap.config$min_dist <- 0
umap.config$n_components <- 50
umap.config$verbose <- T
umap <- umap(t(matrix), config = umap.config, method = "umap-learn")