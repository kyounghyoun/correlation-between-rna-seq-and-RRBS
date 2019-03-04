#!/bin/bash
#wjlim
bismark_genome=$1
firFq=$2
secFq=$3
prefix=$4

bismark\
 $bismark_genome\
 -1 $firFq\
 -2 $secFq\
 --bam\
 -o $prefix.bismark\
 --temp_dir /tmp\
 --gzip\
 --basename $prefix\
 --non_directional

mkdir -p $prefix.methylation_extract

bismark_methylation_extractor\
 -o $prefix.methylation_extract\
 --multicore 4\
 --cutoff 3\
 --buffer_size 4G\
 --genome_folder /data/wjlim/reference/Galgal4/Bismark_ref\
 $prefix.bismark/${prefix}_pe.bam

