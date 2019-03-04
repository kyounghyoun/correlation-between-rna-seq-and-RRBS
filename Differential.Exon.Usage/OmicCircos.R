options(stringAsFactorf=F)
library(OmicCircos)
library(rtracklayer)
# cytoband data construction
# total_bed = read.table('tutal_cyto.bed')
# inclusion_bed = read.table('constitutive_exon.inclusion.bed')
# exclusion_bed = read.table('constitutive_exon.exclusion.bed')
# constitutive_bed = read.table('constitutive_exon.bed')
# 
# mygr = function(inputbed){
#     gr = GRanges(seqnames=Rle(inputbed$V1), 
#                  ranges = IRanges(inputbed$V2, end=inputbed$V3), 
#                  strand = Rle(strand(c(rep('*', length(inputbed$V1)))))
#                  )
#     return(gr)
# }
# 
# mywritetable = function(x, fname){
#     df = data.frame(chrom=seqnames(x), starts = start(x), ends=end(x))
#     write.table(df, file=fname, row.names=F, col.names=F, quote=F, sep='\t')
# }
# 
# total.gr = mygr(total_bed)
# inclusion.gr = mygr(inclusion_bed)
# exclusion.gr = mygr(exclusion_bed)
# constitutive.gr = mygr(constitutive_bed)
# 
# constitutive.gr = c(constitutive.gr.f, constitutive.gr.r)
# alternative.gr = setdiff(total.gr, constitutive.gr)
# mywritetable(alternative.gr, 'alternative.bed')
# 
segment = read.table('cyto.txt')
# segment = read.table('OmicCircos.input.cytodata.txt')
# colnames(segment) = c('chrom','chromstart','chromend','name','giestain')
# seg.name = as.vector(segment[,1])
# db = segAnglePo(segment, seg=seg.name);
# save(segment, file = "UCSC.galgal4.chr.RData")
# save(db,file="UCSC.galgal4.RData")     #cp UCSC.galgal4.*.RData ~/apps/R/lib64/R/library/OmicCircos/data/ 
# 
load(file='mycircos.rda')

alternative_exons = read.table("alternative_exons.0to1.txt", header=T, sep='\t')
# alternative_exons = read.table("test.txt", header=T, sep='\t')
# inclusion = read.table('constitutive_exon.inclusion.txt',header=T, sep='\t')
# inclusion = read.table("inclusion_ratio.input.txt", header=T, sep='\t')

EggInput = read.table('Eggs.DEU.output2OmicCircosInput.txt')
EggInput = EggInput[,-3]
colnames(EggInput) = c('chrom','start','FDR')

# EggsInclusion = read.table('inclusion_ratio.eggs.txt')
EggsInclusion = read.table('Inclusion.txt')
EggsInclusion = EggsInclusion[,-3]
colnames(EggsInclusion) = c('chrom','start','maturedEgg','immaturedEgg')
# EggsDB = segAnglePo(EggsInclusion, seg=as.vector(EggsInclusion[,1]))

genesLabels = read.table('Genes.labels.txt')
colnames(genesLabels) = c('chr','po','end','Gene','FDR')
genesLabels = genesLabels[,-3]

seg.v1 = alternative_exons[,-3]
# seg.v1 = inclusion[,-3]

inclusion = read.table('constitutive_exon.inclusion.txt')
colnames(inclusion) = c('chr','start','end','value')
pdf("Circos_plot.pdf", height=15, width = 15, paper = "special")
par(mar=c(2,2,2,2))
plot(c(1,800), c(1,800), type="n", axes=F, xlab="", ylab="", main="Circos Plot")
mycircos(R=400, cir="galgal4", type="chr", print.chr.lab=T, W=4, scale=T)
mycircos(R=305, cir="galgal4", W=100, col.v = 3, mapping=seg.v1, type="heatmap2", lwd=0.01, col='black', scale=F, col.bar=T)
mycircos(R=250, cir="galgal4", W=45, mapping=EggInput, type="ls", lwd=2, col='red',B=T)
mycircos(R=205, cir="galgal4", W=30, mapping=EggsInclusion, type="ml3", lwd=1, cutoff = 0, col= 'slateblue',B=T)
mycircos(R=200, cir="galgal4", W=10, mapping=genesLabels, type="label",  side='in', col='black')
dev.off()
