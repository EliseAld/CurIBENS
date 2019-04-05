# Imported from https://github.com/willtownes/scrna2019/blob/master/algs/existing.R
library(zinbwave)

zinbwave<-function(Y,L=2){
  #Y is unnormalized counts not log transformed, gene x cell
  #L is the latent dimensions computed
  suppressWarnings(fit<-zinbwave::zinbFit(as.matrix(Y), K=L))
  factors<-as.data.frame(zinbwave::getW(fit))
  colnames(factors)<-paste0("dim",1:L)
  rownames(factors)<-colnames(Y)
  factors
}
