# Using the idea from Kegl paper to estimate the dimension depending on the scale we use to look at the data
# Warning it's not an estimation of the number of clusters but of the lower intrinsic dimensions of a high dimensional dataset

# We need to calculate the r-packing number and then the dimension D of the data (genes x cells)
 
# download data
matrix <- read.table("Guo_data_prePCA.txt", header=T)
data <- t(matrix)
rm(matrix)
# data is cell x gene

# choose the scale r (r2 > r1)

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

# plot and save
pdf("packing_nb.pdf")
scale_dep(data,R,epsilon,metric)
dev.off()