# Imported from https://github.com/willtownes/scrna2019/blob/master/algs/existing.R

library(BiocParallel)
library(zinbwave)

zinbwave<-function(Y,L=2,parallel=FALSE){
  #Y is unnormalized counts not log transformed
  #L is the latent dimensions computed
  if(parallel){
    bp<-BiocParallel::bpparam()
  } else {
    bp<-BiocParallel::SerialParam()
  }
  suppressWarnings(fit<-zinbwave::zinbFit(as.matrix(Y), K=L, BPPARAM=bp))
  factors<-as.data.frame(zinbwave::getW(fit))
  colnames(factors)<-paste0("dim",1:L)
  rownames(factors)<-colnames(Y)
  factors
}
