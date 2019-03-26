# load data
# path
data <- "GSE99254_NSCLC.TCell.S12346.count.txt"
path <- "/Users/elise/Desktop/Guo_lung_2018/"
data <- read.table(paste0(path,data), header=T)
data[1:5,1:5]
data <- data[,-1]
data <- data[!is.na(data[,1]),]
rownames(data) <- data[,1]
data <- data[,-1]
# data is gene x cell
# seurat object
library(Seurat)
library(Matrix)
seurat <- CreateSeuratObject(data)
seurat <- NormalizeData(seurat)
seurat@scale.data <- t(apply(seurat@data,1,function(x) x-mean(x)))
# dim red ?
