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
# test the custom PCA function on Guo data
matrix <- read.table("Guo_data_prePCA.txt", header=T)
PCA <- pca(matrix, norm=T, center=T, transpose=F)
# cells new coordinates are in PCA$x
# variance is in PCA$sdev
# genes projection in PCA space are in PCA$rotation

#plot(PCA$sdev)
#library(factoextra)
#fviz_eig(PCA)
# on the elbow plot there is an elbow at the 3rd PC

#plot(PCA$x[,1],PCA$x[,2])
#plot(PCA$x[,2],PCA$x[,3])
#plot(PCA$x[,3],PCA$x[,4])
#plot(PCA$x[,4],PCA$x[,5])
#plot(PCA$x[,5],PCA$x[,6])
#plot(PCA$x[,6],PCA$x[,7])
#plot(PCA$x[,7],PCA$x[,8])
#plot(PCA$x[,8],PCA$x[,9])
#plot(PCA$x[,9],PCA$x[,10])
#plot(PCA$x[,10],PCA$x[,11])
#hist(PCA$x[,1],breaks=100000)
#hist(PCA$x[,2],breaks=100000)
#hist(PCA$x[,3],breaks=100000)
#hist(PCA$x[,4],breaks=100000)
#hist(PCA$x[,5],breaks=100000)
#hist(PCA$x[,6],breaks=100000)
#hist(PCA$x[,7],breaks=100000)
#hist(PCA$x[,8],breaks=100000)
#hist(PCA$x[,9],breaks=100000)
#hist(PCA$x[,10],breaks=100000)
#hist(PCA$x[,11],breaks=100000)
#hist(PCA$x[,12],breaks=100000)
# it looks super strange... on the PCs plot
# The 6th PC look gaussian already

# Save obj
saveRDS(PCA,file="PCA.rds")

# Let's choose 5 PCs