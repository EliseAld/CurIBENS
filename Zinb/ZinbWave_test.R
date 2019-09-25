# test the custom ZinbWave function on Guo data
library(zinbwave)

# test the custom zinbwave function on Guo data
matrix <- read.table("Guo_data_prePCA.txt", header=T)
zinb <- zinbwave(matrix,L=5)

# Save obj
saveRDS(zinb,file="zinb.rds")