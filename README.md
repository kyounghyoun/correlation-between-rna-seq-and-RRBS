Identification of DNA methylated CpG islands associated with Gene Silence in a Ogye Chicken Adult Body Tissues by RNA-Seq and Reduced Representation Bisulfite Sequencing Data
=====================

 **Requirement**
--------------
- **python** (required packages; numpy; scipy)
- **tophat**
- **bowtie**
- **cufflinks** packages 
- **samtools** (please check release date)
- **BWA** is required for calculating fragment size(Calculating tophat parameters)
- **gawk**


 **Scripts Information**
--------------

 *Transcriptome.quantification*
- step01.2_RNA-seq.preprocessing.sh
- step02.2_RNA-seq.quantification.sh
- Tuxedo.pipe.py
- complexHeatmap.R
--------------

 *Differential.Exon.Usage*
- step03.Differential.Exon.Usages.sh
- OmicCircos.R
--------------

 *Methylation.quantification*
- step01.1_RRBS.preprocessing.sh
- step02.1_RRBS.quantification.sh
--------------

 *correlation.test*
- step04.Pearson_correlation.sh
- pearson.correlation.test.py

 **Description**
--------------
```
We publish the scripts used in the above article for the reader to use
You can not excute all of our scripts and if you want to run the program, 
use Bioprojects PRJNA412408 data.
However,the scripts that can do Pearson's correlation tests include examples of exercises.
__step01__
These bash scripts are divided into parts for quality control of raw data 
and parts for creating reference sequence indexes.
__step02__
These bash scripts contains a python script 
and Bismark excution codes to quantify NGS libraries.
__step03__
There are a rMATS excution script and a R script to plot a circos
__step04__
This directory contains example files 
```
