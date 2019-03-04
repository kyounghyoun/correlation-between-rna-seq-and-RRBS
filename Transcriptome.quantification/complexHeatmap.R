# source('http://bioconductor.org/biocLite.R')
# biocLite(c('amap','RColorBrewer','gplots','corrplot','ggplot2','dendextend','plyr','ComplexHeatmap'))
#########################
#library import
library(ComplexHeatmap)
library(dendextend)
library(plyr)
library(edgeR)

##########################
#func definition
zscore.transform = function(m){
  m = data.matrix(m)
  nr = nrow(m)
  nc = ncol(m)
  limit = 2
  zscore = data.frame(matrix(nrow = nr, ncol = nc))
  
  for (i in 1:nr){
    for (j in 1:nc){
      zscore[i,j] = (m[i,j] - median(m[i,]))
      if (zscore[i,j] > limit){
        zscore[i,j] = limit
      }
      if (zscore[i,j] < -limit){
        zscore[i,j] = -limit
      }
    }
  }
  rownames(zscore) = rownames(m)
  colnames(zscore) = colnames(m)
  return(zscore)
}


#Fold Change Cutoff
fold.change.filtration = function(m, fccutoff){
  m = data.matrix(m)
  nc = ncol(m)
  nr = nrow(m)
  
  can.tsg = list()
  can.tsg.idx = list()
  for (j in 1:nc){
    tmp = NULL
    tmp.idx = NULL
    for (i in 1:nr){
      if (m[i,j]> 0){
        tx = m[i,j] / mean(m[i,-j])
        if (tx > fccutoff){
          tmp = union(tmp, rownames(m)[i])
          tmp.idx = union(tmp.idx,i)
        }
      }
    }
    can.tsg[[j]] = tmp
    can.tsg.idx[[j]] = tmp.idx
  }
  
  can.genes = NULL
  for (i in 1:nc){
    can.genes = union(can.genes, can.tsg[[i]])
  }
  can.idx = match(can.genes,rownames(m))
  return(can.idx)
  
}

tmm.normalization = function(m){
  m = data.matrix(m)
  dgelist = DGEList(round(m), group = colnames(m))
  tmm = calcNormFactors(dgelist)
  tmmScaleFacters = dgelist$samples$lib.size * tmm$samples$norm.factors
  tmmExp = t(t(tmm$counts)/tmmScaleFacters) * mean(tmmScaleFacters)
  return(tmmExp)
}

#######################
ifile = './test.FPKM.bed'
idata = read.table(ifile, sep = '\t', header = T, comment.char = '$')
colnames(idata)[1] = 'chrom'
df = idata[,c(-4:-1)]
head(df)

df.fccut.idx = fold.change.filtration(tmm.normalization(df),16)
df.fccut.filt = df[df.fccut.idx,]
df.fccut.filt.zscore = zscore.transform(df.fccut.filt)

pa = pam(df.fccut.filt.zscore,6)

hm = Heatmap(df.fccut.filt.zscore,
             split = paste0('pam',pa$clustering),
             show_row_names = F,
             name = 'test')
draw(hm)
