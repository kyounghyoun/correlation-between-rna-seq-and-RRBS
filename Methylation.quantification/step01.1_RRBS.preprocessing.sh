IFILEs=$1
REFERENCE=$2

for IFILE in `cat $IFILEs`;
do 
    fastqc $IFILE;
done

bismark_genome_preparation $REFERENCE
