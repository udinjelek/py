import csv
import pyodbc 
import io
import os
import sys 
import gzip
from datetime import datetime, timedelta
from ftplib import FTP_TLS
from ftplib import FTP


# read Setting in -- Start
listWords = []
vDestinSetting 	= os.path.join( os.path.dirname(os.path.abspath(__file__)) , "sysSettingFtp.csv")
with open(vDestinSetting, newline='') as fileSetting:
    reader = csv.reader(fileSetting, delimiter=',', quoting=csv.QUOTE_NONE)
    for row in reader:
        if (row[0] == 'IP FTP :') :                     useServer 		        = row[1]
        if (row[0] == 'username FTP :') :               useUserFtp 		        = row[1]
        if (row[0] == 'password FTP :') :               usePassFtp 		        = row[1]
        if (row[0] == 'folder FTP :') :                 useFtpFolder	        = row[1]
        if (row[0] == 'downloadDay H minus :') :        useMinusDayH	        = row[1]
        if (row[0] == 'folder Output :') :              useOutputFolder	        = row[1]
        if (row[0] == 'clearFolderFtpWhenStart :') :    useModeClearFtpFolder	= row[1]
        if (row[0] == 'listWords :') :                  listWords.append(row[1]) 
# read Setting in -- End


timeStart = datetime.now()
print("timeStart : ",timeStart)

dateUse = datetime.today() - timedelta(days=int(useMinusDayH))
useDate = (dateUse.strftime("%Y%m%d"))
dateUseAnotherFormat = (dateUse.strftime("%Y-%m-%d"))


# useServer 		= "10.34.145.89"
# useUserFtp 		= "twampdata"
# usePassFtp 		= "twamp2021"
# listWords = []
# listWords.append("P2R Lost Percentage")
# listWords.append("R2P Lost Percentage")



ftp = FTP(useServer)
ftp.login(user=useUserFtp, passwd = usePassFtp)


vSourceFolder 	= "/" + useDate
try:
    ftp.cwd(vSourceFolder)
    
except:
    print('ERROR BY JELEK!! ' + vSourceFolder + ' in server ' + useServer + ' not exist')

listFiles = ftp.nlst()
folderPath = os.path.join( os.path.dirname(os.path.abspath(__file__)) ,useOutputFolder)

for file in listFiles:
    for word in listWords:
        if word in file:
            vDestinTarget 	= folderPath + "\\" + file
            vDestinTargetCsv = vDestinTarget[:-3]
            # print(vDestinTarget,vDestinTargetCsv)
            #result should be like = "E:\ResultFtp\dataCsv04\Pm_1275071217_2019031019_Serv135.csv"

            vSourceFile		= file
            vSourceTarget 	= vSourceFolder + "/" + vSourceFile

            localfile = open(vDestinTarget, 'wb')
            try:
                ftp.retrbinary('RETR ' + vSourceFile, localfile.write, 1024)
            except:
                noError = noError + 1
            localfile.close()

            #convert To CSV
            
            fIn = gzip.open(vDestinTarget, 'rb')
            lines = fIn.readlines()
            fileCSV = open(vDestinTargetCsv, "w")
            noLine = 0
            while noLine < len(lines):
                fileCSV.write(dateUseAnotherFormat+',')
                fileCSV.write(lines[noLine].decode('utf-8'))
                noLine = noLine + 1
            fileCSV.close()
            fIn.close()