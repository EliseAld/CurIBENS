# We use the clustering tool from Seurat
library(Seurat)

# Let's run the algorithm
seurat <- FindClusters(seurat, genes.use=hvg, resolution=resol, k.param=k)
table(seurat@ident)
