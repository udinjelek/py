maxNoSql = 15
fileOut =  'BSCSTAT'
fileOut =  fileOut + '.sql'
fileIn = 'sqlIn.sql'

print(fileOut,maxNoSql)

with open(fileIn,'r') as fIn:
	lines = fIn.readlines()
	lines = "".join(lines)

# Write 

fileWriteOut = open(fileOut, "w")	
for i in range(0,maxNoSql):
	noNow = ("0" + str(i+1))[-2:]
	if (i+1) == maxNoSql :
		fileWriteOut.write(lines.replace("xxx",noNow).replace('--- x-x ---','--- End ---'))
	else:
		fileWriteOut.write(lines.replace("xxx",noNow).replace('--- x-x ---','UNION ALL'))
	
fileWriteOut.close()
