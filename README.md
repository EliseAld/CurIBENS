# CurIBENS

Benchmarking of different steps in the scRNAseq analysis of the Guo dataset (NSCLC, 2018)

####################
Dimension reduction
####################

On cherche le nombre de features optimal
- PCA (Elise)     
en cours
- UMAP (Elise)      
en cours
- GOE (Nathalie)
- Zinb-Wave (both)
- NMF (Nathalie)
- Mofa (Nathalie)
- sparse PCA (Elise)
https://web.stanford.edu/~hastie/Papers/spc_jcgs.pdf          
en cours

####################
Determining the optimal nb of clusters
####################

- ICA + MSTD (both)
- ICA + MSTD w/ bulked clusters (Nathalie)
- ICA + MSTD w/ bulked NN (Elise)
- ICA + MSTD w/ bulked cells (Nathalie)
- Evaluation on clustree (Elise)
- Silhouette (Nathalie)
- Packing nb (paper from Kegl) (both)

####################
Clustering
####################

- DBScan + Minkowski (both)
- Louvain based Seurat (both)
- SIMLR (both)
- NMF (Elise)

####################
Goodness of fit
####################

On essaie d'évaluer la justesse du clustering sur le dataset de Guo coupé en train et test sets
- density for each cluster using dbscan (Nathalie)
- density for each cluster w/ own code (both)
- MSE on the clustering identity (Elise)
