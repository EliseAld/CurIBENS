# test the custom PCA function on Guo data
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
matrix <- read.table("Guo_data_prePCA.txt", header=T)
spca <- sPCA(matrix, norm=T, center=T, transpose=F)

# Save obj
save(sPCA,file="sPCA.Robj")

#av <- peav(t(matrix),spca$rotation,center=F)
#plot(av)