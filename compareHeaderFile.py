import os.path
from os import path
from datetime import datetime, timedelta

dateUse = datetime.now()
dateUse = (dateUse.strftime("%Y%m%d"))


arrFileIn = []
arrFileIn.append("text.txt")
arrFileIn.append("text2.txt")
arrFileIn.append("text3.txt")
print("==================================")

for i in range(0,len(arrFileIn)) :
    fileIn = arrFileIn[i]
    prefixCompare = 'Reff-'
    prefixSource = 'Source-'

    fileCompare = prefixCompare +  fileIn
    fileSource = prefixSource +  fileIn
    if path.exists(fileCompare) == False:
        print("ReffNotExist","     ", fileIn)
        continue
    if path.exists(fileSource) == False:
        print("SourceNotExist","     ", fileIn)
        continue
        
    with open(fileCompare,'r') as fIn:
        lines = fIn.readlines()
        noLine = 0
        barisCompare = lines[noLine]

    with open(fileSource,'r') as fIn:
        lines = fIn.readlines()
        noLine = 0
        barisSource = lines[noLine]

print(barisCompare == barisSource,"     ", fileIn)
print("==================================")
input("Code is end in here")
