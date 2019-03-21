# In clustree1, I look at the turning resolutions to plot the turning resolutions as a function of the number of clusters
# Instead of looking manually for these turning resolutions, let's just compute a bunch of resolutions with resulting number of clusters

# It should be a Seurat object
library(Seurat)

# Vector of 200 resolutions to be tested
resol <- seq(0.01, 2, 0.01)

# Running the FindClusters algorithm
cluster_nb = c()
# We can tune the reduction type and the nb of dimensions used
reduction.type <- "pca"
dims.use <- 1:20
for (i in resol) {
  data_seurat <- Seurat::FindClusters(data_seurat, reduction.type = reduction.type, dims.use = dims.use, resolution = i, print.output = 0, force.recalc = 1, n.iter = 10000)
  cluster_nb = c(cluster_nb,length(table(data_seurat@ident)))
}

# Plot the result
plot(cluster_nb,resol)

# Find the gap
# Use a 2-line clustering algorithm (https://ieeexplore.ieee.org/abstract/document/1467530)
