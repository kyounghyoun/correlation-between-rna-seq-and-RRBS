#!/usr/bin/env Rscript
#arguments
args = commandArgs(trailingOnly = TRUE)
prefix = args[1]

#Usage
if (length(args)<1){
    print(sprintf("Usage:cummeRbund.R prefix (in cuffdiff result dir)"))
    q()
}

library(cummeRbund)
cuff = readCufflinks()
dispersion_pdf = sprintf('%s.dispersion.pdf',prefix)
density_pdf = sprintf('%s.density.pdf',prefix)
boxplot_pdf = sprintf('%s.boxplot.pdf',prefix)
scatterMatrix_pdf = sprintf('%s.scatterMatrix.pdf',prefix)
dendrogram_pdf = sprintf('%s.dendrogram.pdf',prefix)
volcanoMatrix_pdf = sprintf('%s.volcanoMatrix.pdf',prefix)
MDS_pdf = sprintf('%s.MDS.pdf',prefix)
PCA_pdf = sprintf('%s.PCA.pdf',prefix)
FPKM_table = sprintf('%s.FPKM.table.txt',prefix)
FPKM_replicates_table = sprintf('%s.FPKM.replicates.table.txt', prefix)
FPKM_replicates_corr = sprintf('%s.Pearson.corr.replicates.table.txt',prefix)

cuff = readCufflinks()

#drawing plots
pdf(dispersion_pdf)
dispersionPlot(genes(cuff))
dev.off()

pdf(density_pdf)
csDensity(genes(cuff))
dev.off()

pdf(boxplot_pdf)
csBoxplot(genes(cuff))
dev.off()

pdf(scatterMatrix_pdf)
csScatterMatrix(genes(cuff))
dev.off()

pdf(dendrogram_pdf)
csDendro(genes(cuff))
dev.off()

pdf(volcanoMatrix_pdf)
csVolcanoMatrix(genes(cuff))
dev.off()

pdf(MDS_pdf)
MDSplot(genes(cuff))
dev.off()

pdf(PCA_pdf)
PCAplot(genes(cuff))
dev.off()

gene.matrix = fpkmMatrix(genes(cuff))  # write fpkm values 
write.table(gene.matrix, file=FPKM_table, sep='\t', quote=F)

#replicates
gene.matrix.replicates = repFpkmMatrix(genes(cuff))
write.table(gene.matrix.replicates, file=FPKM_replicates_table, sep='\t', quote=F)

mycorr = cor(log2(gene.matrix.replicates+1))
write.table(mycorr, file = FPKM_replicates_corr, sep='\t', quote=F)
