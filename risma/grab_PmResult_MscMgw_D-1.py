import csv
import pyodbc 
import io
import os
import sys 
import gzip
from datetime import datetime, timedelta
from ftplib import FTP_TLS
from ftplib import FTP

timeStart = datetime.now()
print("timeStart : ",timeStart)

dateUse = datetime.today() - timedelta(days=1)
dateUse = (dateUse.strftime("%Y%m%d"))
dateUseEnd = datetime.today() - timedelta(days=0)
dateUseEnd = (dateUseEnd.strftime("%Y%m%d"))


arrPmResult = []
# KPI MSC untuk server Taisan 10.167.26.102 
# sebelumnya ini adalah KPi dari server 13 ip 10.23.32.69, hanya saja terjadi imigrasi dan server 13 di hapus

# KPI MSC untuk server Taisan 10.167.26.102 
# sebelumnya ini adalah KPi dari server 20 ip 10.24.127.111, hanya saja terjadi imigrasi dan server 20 di hapus

arrPmResult.append(100665814)
arrPmResult.append(100665822)
arrPmResult.append(100665823)
arrPmResult.append(100665835)
arrPmResult.append(100665851)
arrPmResult.append(100665886)
arrPmResult.append(100665892)
arrPmResult.append(100666003)
arrPmResult.append(1056974608)
arrPmResult.append(1753250002)
arrPmResult.append(1753250012)
arrPmResult.append(1753250040)
arrPmResult.append(1753250044)
arrPmResult.append(83888083)
arrPmResult.append(83888084)
arrPmResult.append(83888087)
arrPmResult.append(83888088)
arrPmResult.append(83888089)
arrPmResult.append(83888090)
arrPmResult.append(83888091)
arrPmResult.append(83888094)
arrPmResult.append(83888096)
arrPmResult.append(83888099)
arrPmResult.append(83888100)
arrPmResult.append(83888103)
arrPmResult.append(83888106)
arrPmResult.append(83888107)
arrPmResult.append(83888114)
arrPmResult.append(83888115)
arrPmResult.append(83888120)
arrPmResult.append(83888121)
arrPmResult.append(83888148)
arrPmResult.append(83888163)
arrPmResult.append(83888175)
arrPmResult.append(83888176)
arrPmResult.append(83888187)
arrPmResult.append(83888188)
arrPmResult.append(83888191)
arrPmResult.append(83888192)
arrPmResult.append(83888198)
arrPmResult.append(83888202)
arrPmResult.append(83888204)
arrPmResult.append(83888214)
arrPmResult.append(83888217)
arrPmResult.append(83888258)
arrPmResult.append(83888300)
arrPmResult.append(83888301)
arrPmResult.append(83888310)
arrPmResult.append(83888314)
arrPmResult.append(83888324)
arrPmResult.append(83888354)
arrPmResult.append(83888355)
arrPmResult.append(83888377)
arrPmResult.append(83888505)
arrPmResult.append(83888608)
arrPmResult.append(83888609)

arrServerUse =[]

arrServerUse =[]
arrServerUse.append(["10.167.26.103","ftpuser","Changeme_123","HOST02"])
arrServerUse.append(["10.167.26.104","ftpuser","Changeme_123","HOST03"])
arrServerUse.append(["10.167.26.105","ftpuser","Changeme_123","HOST04"])

arrServerUse.append(["10.167.26.106","ftpuser","Changeme_123","HOST05"])
arrServerUse.append(["10.167.26.107","ftpuser","Changeme_123","HOST06"])

arrTime = []
arrTime.append(['23','00'])
arrTime.append(['22','23'])
arrTime.append(['21','22'])
arrTime.append(['20','21'])
arrTime.append(['19','20'])
arrTime.append(['18','19'])
arrTime.append(['17','18'])
arrTime.append(['16','17'])
arrTime.append(['15','16'])
arrTime.append(['14','15'])
arrTime.append(['13','14'])
arrTime.append(['12','13'])
arrTime.append(['11','12'])
arrTime.append(['10','11'])
arrTime.append(['09','10'])
arrTime.append(['08','09'])
arrTime.append(['07','08'])
arrTime.append(['06','07'])
arrTime.append(['05','06'])
arrTime.append(['04','05'])
arrTime.append(['03','04'])
arrTime.append(['02','03'])
arrTime.append(['01','02'])
arrTime.append(['00','01'])

modeReload = False

arrDate = []
arrDate.append(dateUse)

arrDateEnd = []
arrDateEnd.append(dateUseEnd)
#use for reload only
# arrDate.append(20190325)
#arrDate.append(20190102)
#arrDate.append(20190103)

#========================================= prepare error Log File =========================================
noError = 0
directoryLog = os.path.dirname(__file__) + "\\dataLog_MscMgw_D-1\\"
textError = ""

#========================================= Delete CSV File =========================================

folderPath = 'D:\\jelek\\dataCsv_MscMgw_D-1'
filePath = ""
dirFile = os.listdir(folderPath)

for file in dirFile:
	if file.lower().find(".csv")<> -1:
		filePath = folderPath + "\\" + file
		# print(filePath)
		os.remove(filePath)
	
#========================================= Download FTP =========================================
ftpOut = FTP("10.22.254.99")
ftpOut.login(user="sss", passwd = "sss")
ftpOut.cwd("/")

for x01 in range(len(arrServerUse)):
	useServer 		= arrServerUse[x01][0]
	useUserFtp 		= arrServerUse[x01][1]
	usePassFtp 		= arrServerUse[x01][2]
	useNoHost		= arrServerUse[x01][3]
	useServerShort 	= str(arrServerUse[x01][0].split('.')[3])
	
	ftp = FTP_TLS(useServer)
	#ftp.debugging = 2
	ftp.login(user=useUserFtp, passwd = usePassFtp)
	ftp.prot_p()
	
	for x02 in range(len(arrPmResult)):
		usePmResult	=	str(arrPmResult[x02])
		for x03 in range(len(arrDate)):
			headerCsvExist = False
			if modeReload == False:
				useDate = str(dateUse)
				useDateEnd = str(dateUseEnd)
			else:
				useDate = str(arrDate[x03])
				useDateEnd = str(arrDateEnd[x03])
			
			vSourceFolder 	= "/opt/oss/server/var/fileint/pm/pmexport_" + useDate
			try:
				ftp.cwd(vSourceFolder)
			except:
				print('ERROR BY JELEK!! ' + vSourceFolder + ' in server ' + useServer + ' not exist')
				continue
				
			for x04 in range(len(arrTime)):
				useTimeS	=	str(arrTime[x04][0])
				useTimeE	=	str(arrTime[x04][1])
								 
				if useTimeS == '23':
					vSourceFile		= useNoHost + "_pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDateEnd + useTimeE + "00.csv.gz"
				else:
					vSourceFile		= useNoHost + "_pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv.gz"
				vSourceTarget 	= vSourceFolder + "/" + vSourceFile
				
				#result should be like =  "//opt/oss/server/var/fileint/pm/pmexport_20190715/HOST04_pmresult_83888458_60_201907150100_201907150200.csv"
				vDestinTarget 	= folderPath + "\\pmr" + usePmResult + "_Serv" + useNoHost + "_" + useDate + useTimeS +  ".csv.gz"
				vDestinTargetCsv = folderPath + "\\pmr" + usePmResult + "_" + useNoHost + "_" + useDate +  "_kirim.csv"
				#result should be like = "E:\ResultFtp\dataCsv04\Pm_1275071217_2019031019_Serv135.csv"
				
				localfile = open(vDestinTarget, 'wb')
				try:
					ftp.retrbinary('RETR ' + vSourceFile, localfile.write, 1024)
				except:
					noError = noError + 1
					textError = textError + "\n" + "Server: " + useServer + ", PmResult: " + usePmResult + ", Date: " + useDate + ", Time: " + useTimeS
				localfile.close()
				
				fIn = gzip.open(vDestinTarget, 'rb')
				lines = fIn.readlines()
				fileCSV = open(vDestinTargetCsv, "a")
				noLine = 0
				while noLine < len(lines):
					if noLine == 0 and headerCsvExist==False:
						headerCsvExist=True
						fileCSV.write(lines[noLine].replace('Successful Operation Rate','Operation Success Rate'))
					if noLine> 1:
						# line = lines[noLine].split(",")
						# line[2] = line[2].replace('HSS9860','')
						# line[2] = line[2].replace('"','')
						# line[2] = '"HF' + line[2] + '"'
						# lines[noLine] = ",".join(line)
						fileCSV.write(lines[noLine])
					noLine = noLine + 1
				fileCSV.close()
				fIn.close()
			
		#========================================= Upload FTP =========================================
		filePath = vDestinTargetCsv
		try:
			fileOpen = open(vDestinTargetCsv,'rb')                  # file to send
			ftpOut.cwd("/FTP_CSV_IP_10.167.26.102/" + useNoHost + "/")
			ftpOut.storbinary('STOR pmresult_'+ usePmResult + '.txt', fileOpen)     # send the file
			fileOpen.close()                                    # close file and FTP
		except:
			noError = noError + 1
			textError = textError + "\n" + "Upload : " + vDestinTargetCsv + " Failed"
		
	ftp.quit()
ftpOut.quit()

if noError > 0:
	fileLogError = open(os.path.join(directoryLog, "errorDataCsvNotAvail.log"), "a")	
	fileLogError.write(textError)
	fileLogError.close()
	# sys.exit()

	
#========================================= Upload FTP =========================================
# # # # # # for file in dirFile:
	# # # # # # ftp = FTP("10.22.254.99")
	# # # # # # ftp.login(user="sss", passwd = "sss")
	# # # # # # ftp.cwd("/")
	# # # # # # if file.lower().find("_kirim.csv")<> -1:
		# # # # # # filePath = folderPath + "\\" + file
		# # # # # # fileOpen = open(filePath,'rb')                  # file to send
		# # # # # # ftp.storbinary('STOR pmresult_1693700127_serv166.txt', fileOpen)     # send the file
		# # # # # # fileOpen.close()                                    # close file and FTP
	
	# # # # # # ftp.quit()
		# # # # # # #print(filePath)
		# # # # # # #os.remove(filePath)
	

