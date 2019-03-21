# Load required packages
source("https://bioconductor.org/biocLite.R")
biocLite("SIMLR")
library(SIMLR)

# data is gene x cells

# Perform the SIMLR clustering
clust_nb = 1:15
resol = 1:10
cluster = list()
for (i in clust_nb) {
  for (j in resol) {
    cluster[[i]] = cbind(cluster[[i]],SIMLR_Large_Scale(data, c=i, k=j, kk = 50)$y)
  }
}
