# The idea is to assume that on the clustree plot, we have overfitting when cells move to other branches
# Hence we need to plot the clustree hierarchy and to look when we observe it

# It should be a Seurat object
library(Seurat)
load("Seurat_PCA.Robj")

# Vector of 20 resolutions to be tested
resol <- seq(0.1, 2, 0.1)

# Running the FindClusters algorithm
# We can tune the reduction type and the nb of dimensions used
reduction.type <- "pca"
dims.use <- 1:20
for (i in resol) {
  seurat <- Seurat::FindClusters(seurat, reduction.type = reduction.type, dims.use = dims.use, resolution = i, print.output = 0, force.recalc = 1, n.iter = 10000)
}

# Plot the tree and save it
pdf("clustree2.pdf")
clustree(seurat)
dev.off()

# Save the seurat obj
save(seurat,"Seurat_clustree2.Robj")

# Pick manually the threshold