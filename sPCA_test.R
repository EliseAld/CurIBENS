# test the custom PCA function on Guo data
library(nsprcomp)
spca <- sPCA(matrix, norm=T, center=T, transpose=F)

#av <- peav(t(matrix),spca$rotation,center=F)
#plot(av)