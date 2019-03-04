paste <(head -n1 ./test.FPKM.bed) <(head -n1 ./test.DNAmeth.bed) > merged.header.txt
cat <(cat merged.header.txt ) <(intersectBed -a test.FPKM.bed -b test.DNAmeth.bed -wa -wb |uniq) > FPKM.DNAmeth.merged.intersectBed
python ./pearson.correlation.test.py
