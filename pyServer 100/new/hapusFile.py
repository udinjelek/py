import os
folderPath = 'D:\ResultFtp\dataCsv'
filePath = ""
arr = os.listdir(folderPath)
tot = 0
print("start")
for xi in arr:
    if xi.lower().find(".csv")<> -1:
        filePath = folderPath + "\\" + xi
        # print(filePath)
        os.remove(filePath)
        tot = tot + 1
    
print( tot)


# os.remove(r'D:\ResultFtp\dataCsv\pmr1275071418_2019041020_ATAE23_Serv184.csv')