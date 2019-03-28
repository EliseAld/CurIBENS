# test the custom PCA function on Guo data
library(nsprcomp)
spca <- sPCA(matrix, norm=T, center=T, transpose=F)