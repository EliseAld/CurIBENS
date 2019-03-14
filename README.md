# CurIBENS

Benchmarking of different steps in the scRNAseq analysis of the Guo dataset (NSCLC, 2018)

####################
Determining the optimal nb of clusters
####################

- ICA + MSTD (both)       
en cours
- ICA + MSTD w/ bulked clusters (Nathalie)
- ICA + MSTD w/ bulked NN (Elise)      
en cours
- ICA + MSTD w/ bulked cells (Nathalie)
- Evaluation on clustree (Elise)          
en cours1   
en cours2
- Silhouette (Nathalie)
- Packing nb for the optimal number of features ! (paper from Kegl) (both)

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

