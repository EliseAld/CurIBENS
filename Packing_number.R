# Using the idea from Kegl paper to estimate the dimension depending on the scale we use to look at the data
# Warning it's not an estimation of the number of clusters but of the lower intrinsic dimensions of a high dimensional dataset

# We need to calculate the r-packing number and then the dimension D of the data (genes x cells)

# choose the scale r
r = c(r1,r2)

# Define metric between two vectors

# Calculate the dimension of the manifold D
low_dimension_estimate <- function(data,r,epsilon,metric) {
  L=matrix(,ncol=2,nrow=ncol(data))
  for (l in 1:ncol(data)) {
    data_perm <- data[,sample(ncol(data),ncol(data))]
    for (k in 1:2) {
      C <- matrix(data_perm[,1])
      for (i in 1:ncol(data)) {
        index = i
        for (j in 1:ncol(C)) {
          if (metric(data[,i],C[,j]) < r[k]) {
            index <- n+1
          }
        }
        if (index < (ncol(data)+1)) {
          C <- cbind(C,data[,i])
        }
      }
      L[l,k] <- log(ncol(C))
    }
    D <- -(mean(L[1:l,2])-mean(L[1:l,1]))/(log(r[2])-log(r[1]))
    if (l > 10 & (1.65*sqrt(vsd(L[1:l,1])^2+sd(L[1:l,2])^2)/sqrt(l)/(log(r[2])-log(r[1]))<D*(1-epsilon)/2)) {
      return(D)
    }
  }
}
    

    
