import csv
import pyodbc 
import io
import os
import sys 
from datetime import datetime, timedelta
from ftplib import FTP

timeStart = datetime.now()
print("timeStart : ",timeStart)

dateUse = datetime.today() - timedelta(days=1)
dateUse = (dateUse.strftime("%Y%m%d"))

arrPmResult = []
arrPmResult.append(1275071217)
arrPmResult.append(1275071218)
arrPmResult.append(67109452)
arrPmResult.append(1275071418)
arrPmResult.append(1275069419)
arrPmResult.append(1275069421)
arrPmResult.append(1275072018)
arrPmResult.append(1275071435)

arrPmResult.append(67109391)
arrPmResult.append(67109469)
arrPmResult.append(67109535)
arrPmResult.append(67109438)
arrPmResult.append(67109367)
arrPmResult.append(67109453)
arrPmResult.append(82833917)
arrPmResult.append(67109420)
arrPmResult.append(67109365)
arrPmResult.append(67109509)


arrPmResult.append(1526726666)
arrPmResult.append(1526726706) #bermasalaah ada counter tambahan di belakang.


arrServerAtae =[]
arrServerAtae.append(["10.23.32.183","ATAE15"])
arrServerAtae.append(["10.23.32.183","ATAE17"])
arrServerAtae.append(["10.23.32.184","ATAE16"])
arrServerAtae.append(["10.23.32.184","ATAE19"])
arrServerAtae.append(["10.23.32.184","ATAE23"])
arrServerAtae.append(["10.23.32.135","ATAE14"])
arrServerAtae.append(["10.23.32.135","ATAE18"])

arrTime = []
arrTime.append([19,20])
arrTime.append([20,21])

modeReload = False

arrDate = []
arrDate.append(dateUse)
#use for reload only
# arrDate.append(20190325)
#arrDate.append(20190102)
#arrDate.append(20190103)
# arrDate.append(20190328)

# arrDate.append(20190329)
# arrDate.append(20190330)
# arrDate.append(20190331)
# arrDate.append(20190401)
# arrDate.append(20190402)
# arrDate.append(20190403)
# arrDate.append(20190404)

#========================================= prepare error Log File =========================================
noError = 0
directoryLog = os.path.dirname(__file__) + "\\dataLog\\"
textError = ""

#========================================= Delete CSV File =========================================

folderPath = 'D:\ResultFtp\dataCsv'
filePath = ""
dirFile = os.listdir(folderPath)

for file in dirFile:
	if file.lower().find(".csv")<> -1:
		filePath = folderPath + "\\" + file
		# print(filePath)
		os.remove(filePath)
		
#========================================= Download FTP =========================================
for x01 in range(len(arrServerAtae)):
	useServer 		= arrServerAtae[x01][0]
	useServerShort 	= str(arrServerAtae[x01][0].split('.')[3])
	useAtae 		= arrServerAtae[x01][1]
	
	ftp = FTP(useServer)
	ftp.login(user='ftp', passwd = 'ftp*666')
	
	for x02 in range(len(arrPmResult)):
		usePmResult	=	str(arrPmResult[x02])
		for x03 in range(len(arrDate)):
			if modeReload == False:
				useDate = str(dateUse)
			else:
				useDate = str(arrDate[x03])
			
			for x04 in range(len(arrTime)):
				useTimeS	=	str(arrTime[x04][0])
				useTimeE	=	str(arrTime[x04][1])
				
				vSourceFolder 	= "//" + useAtae + "/pmexport_" + useDate 
				vSourceFile		= "pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv"
				vSourceTarget 	= "//" + useAtae + "/pmexport_" + useDate + "/pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv"
				#result should be like =  "//ATAE14/pmexport_20190310/pmresult_1275071217_60_201903101900_201903102000.csv"
				vDestinTarget 	= "D:\\ResultFtp\\dataCsv\\pmr" + usePmResult + "_" + useDate + useTimeS + "_" + useAtae + "_Serv" + useServerShort + ".csv"
				#result should be like = "E:\ResultFtp\Pm_1275071217_2019031019_ATAE14_Serv135.csv"
				
				
				ftp.cwd(vSourceFolder)
				localfile = open(vDestinTarget, 'wb')
				try:
					ftp.retrbinary('RETR ' + vSourceFile, localfile.write, 1024)
				except:
					noError = noError + 1
					textError = textError + "\n" + "Server: " + useServer + ", Atae: " + useAtae + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
				localfile.close()
	ftp.quit()

if noError > 0:
	fileLogError = open(os.path.join(directoryLog, "errorDataCsvNotAvail.log"), "a")	
	fileLogError.write(textError)
	fileLogError.close()
	# sys.exit()

	
#======================== Jika tidak ada error di process sebelumnya, process ini akan dikerjakan  ====================
#========================================= Import CSV to SQL Server  =========================================
#========================================= prepare error Log File =========================================
noError = 0
directoryLog = os.path.dirname(__file__) + "\\dataLog\\"
textError = ""

conn = pyodbc.connect('Driver={SQL Server};'
							'Server=10.22.254.100;'
							'Database=NE_HUAWEI;'
							'UID=admin;'
							'PWD=P@ssw0rd;')
cursor = conn.cursor()

for x01 in range(len(arrPmResult)):
	usePmResult	=	str(arrPmResult[x01])
	print(usePmResult)
	for x02 in range(len(arrServerAtae)):
		useServer 		= arrServerAtae[x02][0]
		useServerShort 	= str(arrServerAtae[x02][0].split('.')[3])
		useAtae 		= arrServerAtae[x02][1]
		print(useServer + " " + useAtae)
		for x03 in range(len(arrDate)):
			
			if modeReload == False:
				useDate = str(dateUse)
			else:
				useDate = str(arrDate[x03])
			print(useDate)
			for x04 in range(len(arrTime)):
				useTimeS	=	str(arrTime[x04][0])
				useTimeE	=	str(arrTime[x04][1])
				vDestinFile = "pmr" + usePmResult + "_" + useDate + useTimeS + "_" + useAtae + "_Serv" + useServerShort + ".csv"
				vDestinFolder 	= "D:\\ResultFtp\\dataCsv\\" 
				vDestinTarget 	= vDestinFolder + vDestinFile
				
				# ---- check file ada, dan file memiliki data (size > 0) ---
				if os.path.isfile(vDestinTarget) == True:
					if os.path.getsize(vDestinTarget) > 0 :
						

						with io.open (vDestinTarget, 'r',encoding="utf-8",errors='ignore') as f:
							reader = csv.reader(f)
							columns = next(reader) 
							query = "insert into dbo.tbl_Result_" + usePmResult + "([{0}],[Server],[Atae]) values ({1},'" + useServer + "','" + useAtae + "')"
							# print(query)
							query = query.format("],[".join(columns), ",".join('?' * len(columns)))
							
							# print(query)
							line = 0
							for data in reader:
								# print(query)
								# print(data)
								for iLoop, dat in enumerate(data):
									if dat == '':
										data[iLoop] = None
								line = line + 1
								if line > 1:
									cursor.execute(query, data)
							cursor.commit()	
							
					else:
						noError = noError + 1
						textError = textError + "\n" + "Size 0  === Server: " + useServer + ", Atae: " + useAtae + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
				else:
					noError = noError + 1
					textError = textError + "\n" + "File 0  === Server: " + useServer + ", Atae: " + useAtae + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
					
cursor.close()
conn.close()

if noError > 0:
	fileLogError = open(os.path.join(directoryLog, "errorDataTryImport.log"), "a")	
	fileLogError.write(textError)
	fileLogError.close()
	# sys.exit()
else:
	print("Done")				
			
#========================================================================================================
#========================================= Delete SQL Query H-33 =========================================
dateDeleteQuery = datetime.today() - timedelta(days=33)
dateDeleteQuery = (dateDeleteQuery.strftime("%Y%m%d"))

conn = pyodbc.connect('Driver={SQL Server};'
							'Server=10.22.254.100;'
							'Database=NE_HUAWEI;'
							'UID=admin;'
							'PWD=P@ssw0rd;')

cursor = conn.cursor()

for x02 in range(len(arrPmResult)):
	usePmResult	=	str(arrPmResult[x02])
	useTableNow = "tbl_result_" + usePmResult

	query = "Delete " + useTableNow + " where [result time] < '" + dateDeleteQuery + "'"

	cursor.execute(query)
	cursor.commit()
cursor.close()
conn.close()

timeEnd = datetime.now()
print("timeStart : ",timeEnd)
print("TotalRunTime : ",timeEnd - timeStart)

fileTimeRun = open(os.path.join(directoryLog, "timeRunProcess.log"), "a")	
fileTimeRun.write("\nTime Start: ")
fileTimeRun.write(str(timeStart))
fileTimeRun.write("\nTime End  : ")
fileTimeRun.write(str(timeEnd))
fileTimeRun.write("\n")
fileTimeRun.close()
