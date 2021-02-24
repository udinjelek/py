import pandas as pd
import io

df01 = pd.read_excel('Book1.xlsx',sheet_name= 'dataSheet',  usecols = 'A:C')
df02 = pd.read_excel('Book1.xlsx',sheet_name= 'dataSheet',  usecols = 'L:M', header = 2, nrows  = 6)
df03 = pd.read_excel('Book1.xlsx',sheet_name= 'dataSheet',  usecols = 'H:I')


hasil = df01.merge(df02,left_on='nama',right_on='monster')
hasil = hasil.merge(df03,how='left',left_on='classNo',right_on='noClass')
hasil = hasil[[nama,]]
print(hasil)