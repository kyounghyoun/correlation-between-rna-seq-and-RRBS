IFILEs=$1
MRNA=$2
REFERENCE=$3
fastqc $IFILE
for IFILE in `cat $IFILEs`;
do
    fastqc $IFILE;
done

zcat $IFILE|awk '{a++;if (a%2==1) {print} else {print substr($0,13,88)}}'|gzip > $IFILE &
bwa index $MRNA
bowtie2-build $REFERENCE ${REFERENCE%.fa}
