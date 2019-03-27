# sparse PCA
# let's do a sparse PCA and find the optimal number of sparse PCs

# load the data, remove NA genes
matrix <- read.table(paste0(path,obj_to_load), header=T)
rownames(matrix) <- matrix[,2]
matrix <- matrix[,-c(1,2)]
matrix <- matrix[!is.na(matrix[,1]),]

# Check the distribution of nGene
ngene <- apply(matrix,2,function(x) sum(x!=0))
hist(ngene,breaks=1000)
# We remove the cells with ngene > 6000, otherwise it skews the PCA (variance is biased)
matrix <- matrix[,ngene<6000]

# Check the distribution of percentage of mitotic genes
mitogenes <- grep(pattern="^MT",x=rownames(matrix),value=T)
mitopercent <- colSums(matrix[mitogenes, ])/colSums(matrix)
hist(mitopercent,breaks=1000)
# Distribution is good

# Write the custom function to run sPCA on a gene x cell matrix
sPCA <- function(matrix, norm, center, transpose) {
  if (transpose == T) {
    matrix <- t(matrix)
  }
  if (norm == T) {
    matrix <- apply(matrix,2,function(x) x/var(x))
  }
  if (center == T) {
    matrix <- apply(matrix,2,function(x) x-mean(x))

  }
  library(nsprcomp)
  spca <- nsprcomp(t(matrix),center=F)
  return(spca)
}

# For the optimal nb of PCs I can do
# Jackstraw

# Screeplot
av <- peav(t(matrix),spca$rotation,center=F)
plot(av)

# Manually looking at the shapes of the plots in the sPCA space
