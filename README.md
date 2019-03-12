Correlation between RNA-seq and RRBS
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

 *Transcriptome.quantification*
- step01.2_RNA-seq.preprocessing.sh
- step02.2_RNA-seq.quantification.sh
- Tuxedo.pipe.py
- complexHeatmap.R

 *Differential.Exon.Usage*
- step03.Differential.Exon.Usages.sh
- OmicCircos.R

 *Methylation.quantification*
- step01.1_RRBS.preprocessing.sh
- step02.1_RRBS.quantification.sh

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

- step01
These bash scripts are divided into parts for quality control of raw data 
and parts for creating reference sequence indexes.
- step02
These bash scripts contains a python script 
and Bismark excution codes to quantify NGS libraries.
- step03
There are a rMATS excution script and a R script to plot a circos
- step04
This directory contains 2 example files to test.

```
