# libraries
require(dbscan)
 
# paths
path_curie = "//synapse.curie.net/Stockage_Immunologie/SOUMELIS/Elise/"
path_macbk = "/Users/elise/Desktop/Ordi_Curie/"
obj_to_load = "scRNAseq/Public_sc_data/GEO/Guo_lung_2018/GSE99254_NSCLC.TCell.S12346.count.txt"
path = path_curie
rm(path_macbk)
rm(path_curie)
 
# Load data
matrix <- read.table(paste0(path,obj_to_load), header=T)
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]
data <- data.frame(t(matrix))
rm(matrix)
# data is cell x gene
 
# Getting the kNN for each cell
k <- c(2,5,10)
knn = list()
for (i in 1:length(k)) {
  knn[[i]] <- kNN(data, k[i], sort = F)$id
}
names(knn) = k
# Each matrix contains
 
# Merging the cells with their k[i] NN in data_merge
data_merge = data
for (j in 1:nrow(data)) {
  data_merge[j,] <- rowSums(data[c(j,knn[[i]][j,]),])/(k[i]+1)
}
