#!/usr/bin/env python
import sys
import os
from itertools import *

if len(sys.argv) < 4:
    print "Usage:%s [bismark_methylation_extractor_output] [F or R (F:forward strand file R:reverse strand file)]" % sys.argv[0]
    sys.exit()

bismark = sys.argv[1]
strand = sys.argv[2]
coverage = 10
bismark_dict = {}

for row in imap(lambda x:x.strip('\n').split('\t'), open(bismark).readlines()):
    if len(row) < 5:continue
    row = map(lambda x:int(x) if x.isdigit() else x, row)
    bismark_dict.setdefault((row[2],row[3]),[]).append(row[4])

for key in bismark_dict.keys():
    siteNT = bismark_dict[key]
    if len(siteNT) >= coverage:
        CytosineCount = len(filter(lambda x:x.isupper(), siteNT))
        ThymineCount = len(filter(lambda x:x.islower(), siteNT))
        if CytosineCount+ThymineCount == 0 : continue
        chrom, pos = key
        freqC = '%.1f' % (CytosineCount/float(CytosineCount+ThymineCount)*100)
        freqT = '%.1f' % (ThymineCount/float(CytosineCount+ThymineCount)*100)
        print '\t'.join(map(str,(chrom,pos,int(pos)+1, len(siteNT), CytosineCount, ThymineCount, freqT)))
