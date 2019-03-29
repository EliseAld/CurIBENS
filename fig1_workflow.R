# Create a 3D matrix for the github benchmarking workflow

# Create the step 1 vector (dimension reduction)
dim1 = c("PCA","sPCA","ZinbWave","glmPCA","UMAP","ICA","sICA")

# Create the step 2 vector (optimal nb of clusters)
dim2 = c("clustree1","clustree2","MSTD","PackingNb","ICAbulkedNN")

# Create the step 3 vector (clustering)
dim3 = c("Louvain","DBScan","NMF","SIMLR","ICA","LDA")

# In each cell of the 3D matrix we will have the ARI, silhouette and ground truth comparison


# Create matrix
df = array(rep(c(1,2,3,4,5,6,7),length(dim2)*length(dim3)),dim=c(length(dim1),length(dim3),length(dim2)),dimnames = list(dim1,dim3,dim2))

# Visualize
library(plot3D)
library(reshape2)
M=melt(df)
scatter3D(as.numeric(M$Var1), as.numeric(M$Var2), as.numeric(M$Var3), clab = M$value)
points3d(as.numeric(M$Var1), as.numeric(M$Var2), as.numeric(M$Var3), color = M$value)
