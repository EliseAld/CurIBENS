# Using the idea from Kegl paper to estimate the dimension depending on the scale we use to look at the data
# Warning it's not an estimation of the number of clusters but of the lower intrinsic dimensions of a high dimensional dataset

# We need to calculate the r-packing number and then the dimension D of the data (genes x cells)

# download data and choose r1 & r2
path_curie = "//synapse.curie.net/Stockage_Immunologie/SOUMELIS/Elise/"
path_macbk = "/Users/elise/Desktop/Ordi_Curie/"
obj_to_load = "scRNAseq/Public_sc_data/GEO/Guo_lung_2018/GSE99254_NSCLC.TCell.S12346.count.txt"
path = path_curie
rm(path_macbk)
rm(path_curie)
# Load data
matrix <- read.table(paste0(path,obj_to_load), header=T)
matrix <- matrix[,-1]
matrix <- matrix[!is.na(matrix[,1]),]
rownames(matrix) <- matrix[,1]
matrix <- matrix[,-1]
data <- matrix
rm(matrix)
# take subset of Guo dataset (500 cells)
data <- data[,sample(1:ncol(data),500)]

# choose the scale r (r2 > r1)
distance <- stats::dist(t(data))
hist(distance,breaks=1000)
r1 = max(distance[1:length(distance)], na.rm=T)/100
r2 = max(distance[1:length(distance)], na.rm=T)
r = c(r1,r2)
rm(r1)
rm(r2)

# define metric
metric <- function(x,y) {
  return(dist(rbind(x,y)))
}

# define epsilon
epsilon = 0.01

# Calculate the dimension of the manifold D
low_dimension_estimate <- function(data,r,epsilon,metric) {
  L=matrix(,ncol=2,nrow=ncol(data))
  n = ncol(data)
  for (l in 1:n) {
    data_perm <- data[,sample(n,n)]
    for (k in 1:2) {
      C <- apply(matrix(data_perm[,1],ncol=1),2,as.numeric)
      for (i in 1:n) {
        index = i
        for (j in 1:ncol(C)) {
          if (metric(data[,i],C[,j]) < r[k]) {
            index <- n+1
          }
        }
        if (index < (n+1)) {
          C <- cbind(C,data[,i])
        }
      }
      L[l,k] <- log(ncol(C))
    }
    D <- -(mean(L[1:l,2])-mean(L[1:l,1]))/(log(r[2])-log(r[1]))
    if (l > 10 & (1.65*sqrt(sd(L[1:l,1])^2+sd(L[1:l,2])^2)/sqrt(l)/(log(r[2])-log(r[1]))<D*(1-epsilon)/2)) {
      return(D)
    }
  }
}
low_dimension_estimate(data,r,epsilon,metric)

# look at the scale dependency of D
scale_dep <- function(data,R,epsilon,metric) {
  D = matrix(,nrow=2,ncol=length(R)-1)
  for (i in 1:ncol(D)) {
    D[1,i] = (R[i]+R[i+1])/2
    D[2,i] = low_dimension_estimate(data,R[i:(i+1)],epsilon,metric)
  }
  plot(D[1,],D[2,])
}

# test
R = c(10000,20000,50000,100000)
scale_dep(data,R,epsilon,metric)
