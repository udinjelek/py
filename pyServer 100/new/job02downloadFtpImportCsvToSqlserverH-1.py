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
dateUseEnd = datetime.today() - timedelta(days=0)
dateUseEnd = (dateUseEnd.strftime("%Y%m%d"))


arrPmResult = []
arrPmResult.append(83888505)
arrPmResult.append(1056974608)
arrPmResult.append(1693700128)
arrPmResult.append(1753250044)
arrPmResult.append(1753250002)


arrServerAtae =[]
arrServerAtae.append(["10.23.32.69","perfcore","Komputer#1"])
arrServerAtae.append(["10.24.127.111","performcore","Performance#123"])


arrTime = []
arrTime.append(['00','01'])
arrTime.append(['01','02'])
arrTime.append(['02','03'])
arrTime.append(['03','04'])
arrTime.append(['04','05'])
arrTime.append(['05','06'])
arrTime.append(['06','07'])
arrTime.append(['07','08'])
arrTime.append(['08','09'])
arrTime.append(['09','10'])
arrTime.append(['10','11'])
arrTime.append(['11','12'])
arrTime.append(['12','13'])
arrTime.append(['13','14'])
arrTime.append(['14','15'])
arrTime.append(['15','16'])
arrTime.append(['16','17'])
arrTime.append(['17','18'])
arrTime.append(['18','19'])
arrTime.append(['19','20'])
arrTime.append(['20','21'])
arrTime.append(['21','22'])
arrTime.append(['22','23'])
arrTime.append(['23','00'])

modeReload = False

arrDate = []
arrDate.append(dateUse)

arrDateEnd = []
arrDateEnd.append(dateUseEnd)
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
directoryLog = os.path.dirname(__file__) + "\\dataLog02\\"
textError = ""

#========================================= Delete CSV File =========================================

folderPath = 'D:\ResultFtp\dataCsv02'
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
	useUserFtp 		= arrServerAtae[x01][1]
	usePassFtp 		= arrServerAtae[x01][2]
	useServerShort 	= str(arrServerAtae[x01][0].split('.')[3])
	
	
	ftp = FTP(useServer)
	ftp.login(user=useUserFtp, passwd = usePassFtp)
	
	for x02 in range(len(arrPmResult)):
		usePmResult	=	str(arrPmResult[x02])
		for x03 in range(len(arrDate)):
			if modeReload == False:
				useDate = str(dateUse)
				useDateEnd = str(dateUseEnd)
			else:
				useDate = str(arrDate[x03])
				useDateEnd = str(arrDateEnd[x03])
			for x04 in range(len(arrTime)):
				useTimeS	=	str(arrTime[x04][0])
				useTimeE	=	str(arrTime[x04][1])
				
				vSourceFolder 	= "/export/home/sysm/opt/oss/server/var/fileint/pm/pmexport_" + useDate 
				
				if useTimeS == '23':
					vSourceFile		= "pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDateEnd + useTimeE + "00.csv"
				else:
					vSourceFile		= "pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv"
				vSourceTarget 	= vSourceFolder + "/" + vSourceFile
				
				#result should be like =  "//export/home/sysm/opt/oss/server/var/fileint/pm/pmexport_20190715/pmresult_83888458_60_201907150100_201907150200.csv"
				vDestinTarget 	= "D:\\ResultFtp\\dataCsv02\\pmr" + usePmResult + "_Serv" + useServerShort + "_" + useDate + useTimeS +  ".csv"
				#result should be like = "E:\ResultFtp\Pm_1275071217_2019031019_Serv135.csv"
				
				
				ftp.cwd(vSourceFolder)
				localfile = open(vDestinTarget, 'wb')
				try:
					ftp.retrbinary('RETR ' + vSourceFile, localfile.write, 1024)
				except:
					noError = noError + 1
					textError = textError + "\n" + "Server: " + useServer + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
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
directoryLog = os.path.dirname(__file__) + "\\dataLog02\\"
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
		
		for x03 in range(len(arrDate)):
			
			if modeReload == False:
				useDate = str(dateUse)
			else:
				useDate = str(arrDate[x03])
			print(useDate)
			for x04 in range(len(arrTime)):
				useTimeS	=	str(arrTime[x04][0])
				
				vDestinTarget 	= "D:\\ResultFtp\\dataCsv02\\pmr" + usePmResult + "_Serv" + useServerShort + "_" + useDate + useTimeS +  ".csv"
								
				# ---- check file ada, dan file memiliki data (size > 0) ---
				if os.path.isfile(vDestinTarget) == True:
					if os.path.getsize(vDestinTarget) > 0 :
						

						with io.open (vDestinTarget, 'r',encoding="utf-8",errors='ignore') as f:
							reader = csv.reader(f)
							columns = next(reader) 
							query = "insert into dbo.tbl_Result_" + usePmResult + "([{0}],[Server]) values ({1},'" + useServer + "')"
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
						textError = textError + "\n" + "Size 0  === Server: " + useServer + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
				else:
					noError = noError + 1
					textError = textError + "\n" + "File 0  === Server: " + useServer + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
					
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
