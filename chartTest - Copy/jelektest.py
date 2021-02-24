import pandas as pd
import math
import matplotlib.pyplot as plt

dfx= pd.DataFrame({'nama':['a','b','a','b','a','c'],'class':['x','x','x','x','x','x'],'type':['y','z','y','z','y','z'],'nilai':['1','1','1','1','2','2']})
dfy= pd.DataFrame({'nama':['a','b','c']})
#print(dfx.nilai.unique())

listNilai= pd.DataFrame({'nilai':dfx.nilai.unique()})
#print(listNilai)

dfNamaNilai = pd.merge(listNilai, dfx, on = 'nilai')
dfPrint = pd.pivot_table(dfx , values='nilai', index=['nama'],  columns=['class','type'], aggfunc='max')
print (dfPrint.index[2])
print (list(dfPrint))
print (dfPrint.iloc[2])
#print (dfPrint)
print ('-----------------')
nilaiList = []
nilaiList.append( [ None if x != x else int(x) for x in dfPrint[('x', 'z')]] )
print(nilaiList)

listNow = [1,2,3,99,70]
print (listNow[len(listNow) - 1])