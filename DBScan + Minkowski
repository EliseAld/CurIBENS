# We use the clustering algorithm from dbscan combined with a Minkowski-derived metric learnt by the machine
library(dbscan)

# Get the data (cell x gene)
matrix

# Remove the cells that have a pointdensity below a 95% threshold
density <- pointdensity(matrix,eps=eps,type="density")
hist(density, breaks=10000)
density_threshold <- sort(density)[length(density)*0.95]
abline(v=density_threshold,col="red")
matrix <- matrix[,density > density_threshold]

# Same with lof
lof <- lof(matrix,k=k)
hist(lof,breaks=10000)
lof_threshold <-  sort(lof, decreasing=T)[length(lof)*0.95]
abline(v=lof_threshold,col="red")
matrix <- matrix[,lof > lof_threshold]

# Find a suitable value for eps
kNNdistplot(matrix, k = minPts)
eps=

# Do the clustering with dbscan
cluster1 <- dbscan(matrix, eps=eps, minPts = minPts, borderPoints = F)

# Do the clustering with sNNclust
cluster2 <- sNNclust(matrix, k=k, eps=eps, minPts=minPts, borderPoints = T)
