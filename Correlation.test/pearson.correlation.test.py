import numpy
from scipy.stats.stats import pearsonr
from Util import *

def myPearsonCorrelationTest(LIST1,LIST2):
    Rvalue, Pvalue = pearsonr(LIST1,LIST2)
    if numpy.isnan(Rvalue):
        return False, Pvalue,Rvalue
    else:
        return True, Pvalue, Rvalue

if __name__ == '__main__':
    ifile = './FPKM.DNAmeth.merged.intersectBed'
    ofile = './FPKM.DNAmeth.merged.pearson.txt'
    odata = open(ofile,'w')
    idata = iopen(ifile)
    header = map(lambda x:x.replace('#','') if x.startswith('#') else x,
    idata.next())
    newHeader = '\t'.join(header) + '\tp-value\tr-value\n'
    odata.write(newHeader)
    for row in idata:
        FPKMlist = map(float,row[4:24])
        METHlist = map(float,row[27:47])
        flag, Pvalue, Rvalue = myPearsonCorrelationTest(FPKMlist, METHlist)
        if flag:
            row.insert(-1,'\t'.join(map(str,(Pvalue,Rvalue))))
            odata.write( '\t'.join(row)+'\n')
        else: continue

    odata.close()
