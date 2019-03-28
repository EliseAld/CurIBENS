# Check the distribution of nGene
ngene <- apply(matrix,2,function(x) sum(x!=0))
hist(ngene,breaks=1000)
matrix <- matrix[,ngene<6000]
# We remove the cells with ngene > 6000, otherwise it skews the PCA (variance is biased)
rm(ngene)

# Check the distribution of nCell
ncell <- apply(matrix,1,function(x) sum(x!=0))
hist(ncell,breaks=1000)
# Remove genes expressed in less than 5 cells
matrix <- matrix[ncell>5,]
rm(ncell)

# Check the distribution of percentage of mitotic genes
mitogenes <- grep(pattern="^MT",x=rownames(matrix),value=T)
mitopercent <- colSums(matrix[mitogenes, ])/colSums(matrix)
hist(mitopercent,breaks=1000)
