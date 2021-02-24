#python ver 3.7
#create by jelek 2019-01-24
import os		#aku pake buat deteksi size file

fileUse = []
fileUse.append("'GGSN Pekan Baru Traffic'.csv")
fileUse.append("'GGSN Bandung Traffic'.csv")
                
pathInput = 'C:\\Users\\jelek\\Downloads\\'
pathOutput = 'D:\\Py\\ResultTest\\'
for i in range(2): 	### 2 karena file use nya ada 2###
	writeBool = False
	writeDataMode = False
	titleName = ''
	graphId = ''
	
	fileInput 	= open(pathInput + fileUse[i],'r')
	fileOutput 	= open(pathOutput + 'Out' + ('000' + str(i))[-2:]  + '.csv', 'w')
	
	for line in fileInput :
		if writeBool == False:			### Hapus Unecesery Header, Ambil Variable Title dan Graph id. ###
			if 'Title:' in line:
				titleName = line[line.find('Title:,","') + len('Title:,","') + 1:-2]
				titleName = titleName.replace("'","")
				#print(titleName)
			if 'Graph ID:' in line:
				graphId = line[line.find('Graph ID:,","') + len('Graph ID:,","') + 1:-2] 
				# print(graphId)	
			if len(line) <= 3:
				# print(len(line))
				# print((line))
				writeBool = True
		else:							### Tulis Data Table ###
			lineInput = line.split(',')
			if writeDataMode == False: 	### Tulis Header File ###
				fileOutput.write(lineInput[0] + ',"Title","GraphId",' + lineInput[9]+ "," + lineInput[10] )
				writeDataMode = True
			else: 						### Tulis isi Data File ###
				fileOutput.write(lineInput[0] + ',"' + titleName + '","' +  graphId + '",' + lineInput[9]+ "," + lineInput[10] )	
				
	fileOutput.close()
	fileInput.close()
	print(os.path.getsize(pathOutput + 'Out0' + str(i)  + '.csv'))
#----------------- the script end here, so do my love ---#