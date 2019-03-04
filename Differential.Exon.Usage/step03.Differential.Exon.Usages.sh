PREFIX1=$1
PREFIX2=$2
RNASeq-MATS.py -b1 tophat/$PREFIX1.tophat.accepted_hits.bam -b2 tophat/$PREFIX2.tophat.accepted_hits.bam -gtf ./combined.gtf -o $PREFIX1.vs.$PREFIX2.mats -r1 185 -sd1 40 -r2 185 -sd2 40 -t paired -len 88 -a 8 -c 0.05 -keepTemp -analysis U 1> $PREFIX1.vs.$PREFIX2.mats.log 2> $PREFIX1.vs.$PREFIX2.mats.err
Rscript ./OmicCircos.R
