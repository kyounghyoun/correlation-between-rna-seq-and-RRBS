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

Publication : Identification of DNA-methylated CpG islands associated with Gene Silence 
in Adult Body Tissues of Ogye Chicken using RNA-seq and Reduced Representation Bisulfite Sequencing (Under review)

The scripts used in the above article for RNA-seq and RRBS analysis 
The dataset usesd in this article can be accessible at NCBI SRA Bioprojects PRJNA412404 (RNA) and PRJNA412432 (RRBS). 
The complete script may run by using the exact dataset used in the study. 
However, the scripts include examples of exercies on Pearson's correlation tests. 

- step01
These bash scripts are divided into parts for quality control of raw data 
and parts for creating reference sequence indexes.
- step02
These bash scripts contains python script 
and Bismark excution codes to quantify NGS libraries.
- step03
There are a rMATS excution script and a R script to viualize circosplot.
- step04
This directory contains 2 example files to run Pearson's correlation test.

```
