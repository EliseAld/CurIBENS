# Load packages
library(NMF)

# ensure that the matrix is non-negative, and data is cell x gene
sum(data < 0)

# Choosing the nsNMF to get a sparse decomposition
# Choosing the nnSVD for a sparse initialization (or ica)

# Running the nmf algorithm
rank = 1:15
cluster = list()
for (i in rank) {
  cluster[[i]] = nmf(data, rank=rank, method=nSNMF, seed=nnSVD, objective='KL')
}
