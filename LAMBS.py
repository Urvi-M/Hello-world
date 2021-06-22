# -*- coding: utf-8 -*-
"""
Created on Sun May  9 18:04:52 2021

@author: Urvi
"""
import numpy as np
# C is the number of LAMBs available to be distributed to the henchmen according to the rules

def generous(C):
    # geometric series
    x= np.log2(C+1)
    return int(x)
def stingy(C):
    # fibonacci series
    # S(n) = F(n+2) – 1 = C
    # C+1= F(n-2)
      a=1 ; b=1 ; c=0; i=2
      while C>=c:
          for i in range(1,C+1):
            c = a + b
            a = b
            b = c
            c=c+b
            if c<C:
                i=i+1
                return i
       
    

