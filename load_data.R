# load the data
path = "/Users/elise/Desktop/Guo_lung_2018/"
obj_to_load = "GSE99254_NSCLC.TCell.S12346.count.txt"
matrix <- read.table(paste0(path,obj_to_load), header=T)
rm(path)
rm(obj_to_load)

# Remove first two columns and get the gene names
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]

# Matrix is gene x cell