#python ver 3.7
#create by jelek
import os		#aku pake buat deteksi size file


fileOld = open('C:\\Users\\jelek\\Downloads\\GGSN Bandung Traffic.csv','r')
fileNew = open('C:\\Users\\jelek\\Downloads\\Cacti01.csv', 'w')

writeBool = False
writeDataMode = False
titleName = ''
graphId = ''
for line in fileOld :
	if writeBool == True:			#Tulis Data Table
		lineInput = line.split(',')
		if writeDataMode == False: 	#Tulis Header File
			fileNew.write(lineInput[0] + ',"Title","GraphId",' + lineInput[9]+ "," + lineInput[10] )
			writeDataMode = True
		else: 						#Tulis isi Data File
			fileNew.write(lineInput[0] + ',"'+ titleName + '","' +  graphId + '",' + lineInput[9]+ "," + lineInput[10] )
			
	else:							#Hapus Unecesery Header, Ambil Variable Title dan Graph id.
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
			
fileNew.close()
print(os.path.getsize('C:\\Users\\jelek\\Downloads\\Cacti01.csv'))



