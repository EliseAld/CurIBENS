# CurIBENS

Benchmarking of different steps in the scRNAseq analysis of the Guo dataset (NSCLC, 2018)

####################
Clustering
####################

- DBScan + Minkowski (both)       
en cours
- Louvain based Seurat (both)     
en cours
- SIMLR (both)      
en cours
- NMF (Elise)     
en cours
- LDA (semantic analysis)

####################
Goodness of fit
####################

On essaie d'évaluer la justesse du clustering sur le dataset de Guo coupé en train et test sets
- density for each cluster using dbscan (Nathalie)
- density for each cluster w/ own code (both)
- MSE on the clustering identity (Elise)
