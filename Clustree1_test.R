# In clustree1, I look at the turning resolutions to plot the turning resolutions as a function of the number of clusters
# Instead of looking manually for these turning resolutions, let's just compute a bunch of resolutions with resulting number of clusters

# It should be a Seurat object
library(Seurat)
load("Seurat_PCA.Robj")

# Vector of 200 resolutions to be tested
resol <- seq(0.01, 2, 0.01)

# Running the FindClusters algorithm
cluster_nb = c()
# We can tune the reduction type and the nb of dimensions used
reduction.type <- "pca"
dims.use <- 1:20
for (i in resol) {
  seurat <- Seurat::FindClusters(seurat, reduction.type = reduction.type, dims.use = dims.use, resolution = i, print.output = 0, force.recalc = 1, n.iter = 10000)
  cluster_nb = c(cluster_nb,length(table(seurat@ident)))
}

# Plot the result and save it
pdf("clustree1.pdf")
plot(cluster_nb,resol,xlab = "Number of clusters", ylab = "Resolution")
dev.off()

# Save the results
write.table(cluster_nb,"clustree1.txt")

# Find the gap
# Use a 2-line clustering algorithm (https://ieeexplore.ieee.org/abstract/document/1467530)
