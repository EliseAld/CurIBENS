# Python

# Upload label and expression matrices
# Finding the dimension
import pandas
J = pandas.read_csv("expression_J.csv", sep=";",index_col=0)
J.shape

# https://scikit-learn.org/stable/auto_examples/decomposition/plot_ica_blind_source_separation.html

# ICA preparation
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
from sklearn.decomposition import FastICA
J /= J.std(axis=0)  # Standardize data
J.shape

# Generate 100 random seeds
import random
seeds = random.sample(range(1, 500), 99)
len(seeds)

# Prevent the NaN values warning
J = J.dropna(how='all',axis=1)
J.shape

# for different values of n_components
from sklearn.cluster import KMeans
n_compo = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
stability = []
stab_list = []
for n in n_compo:
    ica = FastICA(n_components=n,random_state=1000) # Initialize components matrix
    S_ = ica.fit_transform(J)
    components = ica.mixing_
    for seed in seeds: # Run the ICA 99x
        ica = FastICA(n_components=n,random_state=seed)
        S_ = ica.fit_transform(J)
        A_ = ica.mixing_  # Get estimated mixing matrix
        components = np.c_[components,A_] # Fill the components matrix with 100xn components
    HC = 1 - np.absolute(np.corrcoef(components,rowvar=False)) # Dissimilarity matrix (100xn),(100xn)
    kmeans_model = KMeans(n_clusters=n) # Compute n clusters
    kmeans_model.fit(HC)
    labels = kmeans_model.labels_ # Get the cluster label for each component
    R = 1 - HC # Pearson correlation coefficients (100xn),(100xn)
    R = np.tril(R, k=0) # Get the lower triangular matrix with the diagonal
    stab = [] # Compute the stability for cluster
    for k in range(n):
        clusterk = np.array(labels==k)
        R1 = R[:,clusterk]
        R1 = R1[clusterk,:]
        R2 = R[np.logical_not(clusterk),:]
        R2 = R2[:,clusterk]
        index = np.sum(R1)/np.power(np.sum(clusterk),2) - np.sum(R2)/np.sum(clusterk)/np.sum(np.logical_not(clusterk))
        stab.append(index)
    stab_list.append(stab)
    stability.append(np.sum(stab)/n)
print(stability)

# Plot the MSTD profile
import matplotlib.pyplot as plt
plt.axis(xmin=2,xmax=22,ymin=0.2,ymax=0.6)
plt.plot(range(2,len(stab_list[0])+2),np.sort(stab_list[0])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[1])+2),np.sort(stab_list[1])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[2])+2),np.sort(stab_list[2])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[3])+2),np.sort(stab_list[3])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[4])+2),np.sort(stab_list[4])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[5])+2),np.sort(stab_list[5])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[6])+2),np.sort(stab_list[6])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[7])+2),np.sort(stab_list[7])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[8])+2),np.sort(stab_list[8])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[9])+2),np.sort(stab_list[9])[::-1],  color='gray')
plt.plot(range(2,len(stab_list[10])+2),np.sort(stab_list[10])[::-1],color='gray')
plt.plot(range(2,len(stab_list[11])+2),np.sort(stab_list[11])[::-1],color='gray')
plt.plot(range(2,len(stab_list[12])+2),np.sort(stab_list[12])[::-1],color='gray')
plt.plot(range(2,len(stab_list[13])+2),np.sort(stab_list[13])[::-1],color='gray')
plt.plot(range(2,len(stab_list[14])+2),np.sort(stab_list[14])[::-1],color='gray')
plt.plot(range(2,len(stab_list[15])+2),np.sort(stab_list[15])[::-1],color='gray')
plt.plot(range(2,len(stab_list[16])+2),np.sort(stab_list[16])[::-1],color='gray')
plt.plot(range(2,len(stab_list[17])+2),np.sort(stab_list[17])[::-1],color='gray')
plt.plot(range(2,len(stab_list[18])+2),np.sort(stab_list[18])[::-1],color='gray')
plt.plot(n_compo, np.sort(stability)[::-1], color='red')
plt.show()

# Get the stability starting at 1
stabilos = stab_list
for i in range(len(n_compo)):
    increment = 1 - max(stabilos[i])
    stabilos[i] += increment
increment = 1 - max(stability)
stability += increment

# Plot the MSTD profile
import matplotlib.pyplot as plt
plt.axis(xmin=2,xmax=22,ymin=0.8,ymax=1)
plt.plot(range(2,len(stabilos[0])+2),np.sort(stabilos[0])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[1])+2),np.sort(stabilos[1])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[2])+2),np.sort(stabilos[2])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[3])+2),np.sort(stabilos[3])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[4])+2),np.sort(stabilos[4])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[5])+2),np.sort(stabilos[5])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[6])+2),np.sort(stabilos[6])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[7])+2),np.sort(stabilos[7])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[8])+2),np.sort(stabilos[8])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[9])+2),np.sort(stabilos[9])[::-1],  color='gray')
plt.plot(range(2,len(stabilos[10])+2),np.sort(stabilos[10])[::-1],color='gray')
plt.plot(range(2,len(stabilos[11])+2),np.sort(stabilos[11])[::-1],color='gray')
plt.plot(range(2,len(stabilos[12])+2),np.sort(stabilos[12])[::-1],color='gray')
plt.plot(range(2,len(stabilos[13])+2),np.sort(stabilos[13])[::-1],color='gray')
plt.plot(range(2,len(stabilos[14])+2),np.sort(stabilos[14])[::-1],color='gray')
plt.plot(range(2,len(stabilos[15])+2),np.sort(stabilos[15])[::-1],color='gray')
plt.plot(range(2,len(stabilos[16])+2),np.sort(stabilos[16])[::-1],color='gray')
plt.plot(range(2,len(stabilos[17])+2),np.sort(stabilos[17])[::-1],color='gray')
plt.plot(range(2,len(stabilos[18])+2),np.sort(stabilos[18])[::-1],color='gray')
plt.plot(n_compo, np.sort(stability)[::-1], color='red')
plt.show()
