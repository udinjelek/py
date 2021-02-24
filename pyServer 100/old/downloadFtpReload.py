from datetime import datetime, timedelta
from ftplib import FTP

dateUse = datetime.today() - timedelta(days=1)
dateUse = (dateUse.strftime("%Y%m%d"))

#domain name or server ip:


arrServerAtae =[]
arrServerAtae.append(["10.23.32.135","ATAE14"])
arrServerAtae.append(["10.23.32.135","ATAE18"])
arrServerAtae.append(["10.23.32.183","ATAE15"])
arrServerAtae.append(["10.23.32.183","ATAE17"])
arrServerAtae.append(["10.23.32.184","ATAE16"])
arrServerAtae.append(["10.23.32.184","ATAE19"])
arrServerAtae.append(["10.23.32.184","ATAE23"])

arrPmResult = []
arrPmResult.append(1275071217)
arrPmResult.append(1275071218)
arrPmResult.append(67109452)
arrPmResult.append(1275071418)
arrPmResult.append(1275069419)
arrPmResult.append(1275069421)

arrTime = []
arrTime.append([19,20])
arrTime.append([20,21])

modeReload = True

arrDate = []
# arrDate.append(dateUse)
# use for reload only
# arrDate.append(20190325)
# arrDate.append(20190326)
# arrDate.append(20190327)
# arrDate.append(20190328)

# arrDate.append(20190329)
# arrDate.append(20190330)
# arrDate.append(20190331)
# arrDate.append(20190401)
# arrDate.append(20190402)
# arrDate.append(20190403)
# arrDate.append(20190404)

arrDate.append(20190405)
arrDate.append(20190406)
arrDate.append(20190407)



for x01 in range(len(arrServerAtae)):
	useServer 		= arrServerAtae[x01][0]
	useServerShort 	= str(arrServerAtae[x01][0].split('.')[3])
	useAtae 		= arrServerAtae[x01][1]
	
	ftp = FTP(useServer)
	ftp.login(user='ftp', passwd = 'ftp*666')
	#ftp.cwd("/resultFtp")
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
				ftp.retrbinary('RETR ' + vSourceFile, localfile.write, 1024)
				localfile.close()
	ftp.quit()
    


# # # # # # CREATE 
    # # # # # # TABLE REPORT_BHCA_HOURLY 
    # # # # # # ( 
        # # # # # # NE VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS, 
        # # # # # # TIME SMALLDATETIME, 
        # # # # # # BHCA FLOAT(53), 
        # # # # # # THRESHOLD FLOAT(53), 
        # # # # # # BHCA_UTIL FLOAT(53) 
    # # # # # # )
