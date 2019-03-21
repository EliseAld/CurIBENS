# load data
# path
data
common <- "//synapse.curie.net/Stockage_Immunologie/SOUMELIS/Elise/scRNAseq/"
data <- read.csv2(paste0(path,data), sep=",", header=T)
data[1:5,1:5]
# data is cell x gene
# seurat object
library(Seurat)
library(Matrix)
data <- Matrix(t(data),sparse=T)
data[is.na(data)] <- 0
colnames(data)
seurat <- CreateSeuratObject(data)
seurat <- NormalizeData(seurat)
seurat@scale.Data <- t(apply(seurat@data,1,function(x) x-mean(x)))
# dim red ?