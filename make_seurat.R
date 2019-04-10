# Make seurat object with pca slot
matrix <- read.table("Guo_data_prePCA.txt", header=T)
seurat <- CreateSeuratObject(matrix)
rm(matrix)
seurat <- NormalizeData(seurat)
seurat@scale.data <- t(apply(seurat@data,1,function(x) x-mean(x)))
seurat <- RunPCA(seurat, pc.genes=rownames(seurat@data), pcs.compute = 50, genes.print = 10)
save(seurat,file=paste0(path,"Seurat_PCA.Robj"))