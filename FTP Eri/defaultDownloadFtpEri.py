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


useServer 		= "10.34.145.89"
useUserFtp 		= "twampdata"
usePassFtp 		= "twamp2021"
listWords = []
listWords.append("P2R Lost Percentage")
listWords.append("R2P Lost Percentage")

useDate = dateUse

ftp = FTP(useServer)
ftp.login(user=useUserFtp, passwd = usePassFtp)


vSourceFolder 	= "/" + useDate
try:
    ftp.cwd(vSourceFolder)
    
except:
    print('ERROR BY JELEK!! ' + vSourceFolder + ' in server ' + useServer + ' not exist')

listFiles = ftp.nlst()
folderPath = os.path.join( os.path.dirname(os.path.abspath(__file__)) , "outputFtp")

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
                fileCSV.write(lines[noLine].decode('utf-8'))
                noLine = noLine + 1
            fileCSV.close()
            fIn.close()