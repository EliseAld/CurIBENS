# Merge a cell with its k NN - do it with dbscan
library(dbscan)

# data is cell x gene

# Getting the kNN for each cell
k <- c(2,5,10,20)
knn = list()
for (i in 1:length(k)) {
  knn[[i]] <- kNN(data, k[i], sort = F)$id)
}
names(knn) = k

# Merging the cells with their k[i] NN in data_merge
data_merge = data
for (j in 1:nrow(data)) {
  data_merge[j,] <- rowSums(data[c(j,knn[[i]][j,]),])/k[i]
}
