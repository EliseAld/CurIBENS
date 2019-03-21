# From a single cell dataset we are trying to get the must link/cannot link constraints described in the ML tutorial

# The dataset is gene x cell and is in a seurat object, center and normalized
head(seurat)

# From this paper (https://arxiv.org/pdf/1704.02268.pdf) we are just looking for the closest and farthest cells

# For the closest we use the tSNE space
seurat <- RunTSNE(seurat, genes.use = rownames(seurat@data), seed.use = 1, add.iter = 1, dim.embed = 3)
dist_close <- dist(seurat@dr$tsne@cell.embeddings)
must_link <- apply(dist_close,2,function(x) which(x == min(x)))

# For the farthest we use the PCA space
seurat <- RunPCA(seurat, pc.genes = rownames(seurat@data), pcs.compute = 3, seed.use = 42)
dist_far <- dist(seurat@dr$pca@cell.embeddings)
cannot_link <- apply(dist_far,2,function(x) which(x == max(x)))

# For the farthest we use the Mahalanobis distance in the PCA space
seurat <- RunPCA(seurat, pc.genes = rownames(seurat@data), pcs.compute = 3, seed.use = 42)
dist_far <- mahalanobis(seurat@dr$pca@cell.embeddings, center=F)
cannot_link <- apply(dist_far,2,function(x) which(x == max(x)))

# Does it matches the results in the UMAP space ?
seurat <- RunUMAP(seurat, genes.use = rownames(seurat@data), max.dim = 3L, n_neighbors = 30L, min_dist = 0.2, seed.use = 42)
dist <- dist(seurat@dr$umap@cell.embeddings)
link <- rbind(apply(dist,2,function(x) which(x == min(x))),apply(dist,2,function(x) which(x == max(x))))
link[1,] == must_link
link[2,] == cannot_link

# The constraints should be different as well
sum(must_link == cannot_link)
