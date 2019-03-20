# PCA
# let's do a PCA and find the optimal number of PCs

# load the data
matrix <- read.table(paste0(path,obj_to_load), header=T)
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]

# Check the distribution of nGene
ngene <- apply(matrix,2,function(x) sum(x!=0))
hist(ngene,breaks=1000)
matrix <- matrix[,ngene<6000]
# We remove the cells with ngene > 6000, otherwise it skews the PCA (variance is biased)

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

# do the PCA
pca <- prcomp(t(matrix))


# For the optimal nb of PCs I can do
# Jackstraw

# Screeplot

# Manually looking at the shapes of the plots in the PCA space
