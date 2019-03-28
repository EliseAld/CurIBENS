# load the data
path
obj_to_load
matrix <- read.table(paste0(path,obj_to_load), header=T)

# Remove first two columns and get the gene names
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]

# Matrix is gene x cell
