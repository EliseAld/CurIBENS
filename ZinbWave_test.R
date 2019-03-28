# test the custom ZinbWave function on Guo data
library(BiocParallel)
library(zinbwave)

zinb <- zinbwave(t(matrix),L=2)
sum(apply(matrix,1,sum) == 0)
