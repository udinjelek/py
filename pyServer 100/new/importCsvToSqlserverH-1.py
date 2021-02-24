import csv
import pyodbc 
import io
from datetime import datetime, timedelta

dateUse = datetime.today() - timedelta(days=1)
dateUse = (dateUse.strftime("%Y%m%d"))

arrPmResult = []
arrPmResult.append(1275071217)
arrPmResult.append(1275071218)
arrPmResult.append(67109452)
arrPmResult.append(1275071418)
arrPmResult.append(1275069419)
arrPmResult.append(1275069421
arrPmResult.append(1275072018)
arrPmResult.append(1275071435)

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

                # vSourceFolder 	= "//" + useAtae + "/pmexport_" + useDate 
                # vSourceFile		= "pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv"
                # vSourceTarget 	= "//" + useAtae + "/pmexport_" + useDate + "/pmresult_" + usePmResult + "_60_" + useDate + useTimeS + "00_" + useDate + useTimeE + "00.csv"
                # result should be like =  "//ATAE14/pmexport_20190310/pmresult_1275071217_60_201903101900_201903102000.csv"
                vDestinFile = "pmr" + usePmResult + "_" + useDate + useTimeS + "_" + useAtae + "_Serv" + useServerShort + ".csv"
                vDestinTarget 	= "D:\\ResultFtp\\dataCsv\\" + vDestinFile

                conn = pyodbc.connect('Driver={SQL Server};'
                    'Server=10.22.254.100;'
                    'Database=NE_HUAWEI;'
                    'UID=admin;'
                    'PWD=P@ssw0rd;')

                with io.open (vDestinTarget, 'r',encoding="utf-8",errors='ignore') as f:
                    reader = csv.reader(f)
                    columns = next(reader) 
                    query = "insert into dbo.tbl_Result_" + usePmResult + "([{0}],[Server],[Atae]) values ({1},'" + useServer + "','" + useAtae + "')"
                    # print(query)
                    query = query.format("],[".join(columns), ",".join('?' * len(columns)))
                    cursor = conn.cursor()
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
                    cursor.close()

                    conn.close()

print("Done")				
			
			# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # x

# cursor = conn.cursor()
# cursor.execute('select obj_name from T_Voip_in group by obj_name')

# for row in cursor:
    # print(row)
	
	
	


