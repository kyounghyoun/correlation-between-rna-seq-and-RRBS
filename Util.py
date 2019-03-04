#!/usr/bin/env python
import sys, os, string, gzip, math, operator, re, time, itertools
from itertools import *

"""
    Common Utility 
"""

def iopen(ifile):
    return imap(lambda x:x.strip().split('\t'),open(ifile) )

def izopen(ifile):
    return imap(lambda x:x.strip().split('\t'),gzip.GzipFile(ifile))

def frange(start, end=None, inc=1.0):
    L = []
    if end is None:
        end = start + 0.0
        start = 0.0
    assert inc
    for i in itertools.count():
        Next = start + i * inc
        if (inc > 0.0 and Next > end) or (inc < 0.0 and Next < end):
            break
        L.append(Next)
    return L

def invert_dict(d):
    return dict(izip(d.itervalues(),d.iterkeys()))

def my_time():
    return time.strftime('%y/%m/%d-%H:%M:%S')

def my_sort(L):
    conv = lambda x:int(x) if x.isdigit() else x
    KEY = lambda x:[conv(c) for c in re.split('([0-9]+)',x)]
    return sorted(L,key=KEY)

def faiter(fasta):
    for key, group in groupby(open(fasta),lambda x:x[0]=='>'):
        if key:
            header = group.next().strip()
            continue
        else:
            seq = ''.join(i.strip() for i in group)

        yield header, seq

def Pearson(x,y):
    xavg = sum(x)/len(x)
    yavg = sum(y)/len(y)
    
    s1,s2,s3 = 0.0, 0.0, 0.0
    for xi, yi in zip(x,y):
        s1 += (xi-xavg)*(yi-yavg)
        s2 += (xi-xavg)**2
        s3 += (yi-yavg)**2
    r = ( s1/len(x) ) / ( math.sqrt(s2/len(x)) * math.sqrt(s3/len(y)) )
    return r

def combination(n,k):
    if k>n-k: 
        ma = k
        mi = n-k
    else: 
        ma =n-k
        mi = k 
            
    val = float(factorial_from(n,ma))/(float(factorial(mi)))

def zscore(U):
    U = map(float,U)
    avg = sum(U)/float(len(U))
    square_ave = 0.0
    for i in xrange(len(U)):
        square_ave += (U[i]-avg)*(U[i]-avg)
    sd = math.sqrt(square_ave/float(len(U)) )
    for i in xrange(len(U)):
        U[i] = (U[i]-avg)/sd

    return U

def Zval(alist, val):
    from scipy.stats import norm
    alist = map(float,alist)
    avg = float( sum(alist) ) / float(len(alist))
    vlist = [(x-avg)*(x-avg) for x in alist]
    sd = math.sqrt( sum(vlist)/float(len(vlist)) )
    z = (val-avg)/sd
    pval = 1.0*(1.0-norm.cdf(z))
    return z,pval,avg,sd

	
def sort_by(li,n,reverse=0):

    nlist = map(lambda x, n = n: (x[n],x), li)
    nlist.sort()
    if reverse==1: nlist.reverse()
    return map(lambda (key,x): x, nlist)
