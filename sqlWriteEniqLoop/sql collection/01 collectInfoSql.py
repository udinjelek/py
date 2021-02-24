import os
listDirArr = os.listdir()

fileOut = "02 listSummary.csv"
fileWriteOut = open(fileOut, "w")	
fileWriteOut.write("Filename,tableName,lengthTable\n")
for nameFile in listDirArr:
	if nameFile[-4:] == ".sql":
		
		with open(nameFile,'r') as fIn:
			lines = fIn.readlines()
			rowSet = len(lines) - 11 
			tableName = lines[rowSet]
			fileWriteOut.write(nameFile + "," + tableName)
			
fileWriteOut.close()