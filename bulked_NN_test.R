# libraries
library(dbscan)
 
# Load data
matrix <- read.table("Guo_data_prePCA.txt", header=T)
matrix <- t(matrix)
# data is cell x gene
 
# Getting the kNN for each cell
k <- c(2,5,10)
knn = list()
for (i in 1:length(k)) {
  knn[[i]] <- kNN(matrix, k[i], sort = F)$id
}
names(knn) = k
# Each matrix contains
 
# Merging the cells with their k[i] NN in matrix_merge
matrix_merge = matrix
for (j in 1:nrow(matrix)) {
  matrix_merge[j,] <- rowSums(matrix[c(j,knn[[i]][j,]),])/(k[i]+1)
}

# Save the merged matrix
write.table(matrix.merge,"Guo_data_bulkedNN.txt")