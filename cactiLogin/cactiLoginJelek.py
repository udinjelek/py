import io
import os
import requests
import pyodbc
from datetime import datetime, timedelta

loginData = {'login_username' : 'perform', 'login_password' : 'quality*1', 'action' : 'login'}
fileCsvNow = 'TotalGgsn_H-0.csv'
fileCsvOld = 'TotalGgsn_H-7.csv'
if os.path.isfile(fileCsvNow): 	os.remove(fileCsvNow)
if os.path.isfile(fileCsvOld): 	os.remove(fileCsvOld)
with requests.Session() as ss:
	url= "http://10.24.125.226/cacti/"
	rr = ss.get(url)
	# print(rr.content)
	rr = ss.post(url,data= loginData)

	timeOnly_00 = datetime.min.time()
	timeOnly_99 = datetime.max.time()
	# ------------
	dateOnlyNow = datetime.now().date() 
	dateNowTime00 = datetime.combine(dateOnlyNow, timeOnly_00) - timedelta(seconds=(60)*30)
	timeStampStartNow = datetime.timestamp(dateNowTime00)
	timeStampStartNow = str(int(timeStampStartNow))

	dateNowTimeNow = datetime.now()
	timeStampEndNow   = datetime.timestamp(dateNowTimeNow)
	timeStampEndNow   = str(int(timeStampEndNow))
	# ------------
	dateOnlyOld = datetime.now().date() - timedelta(days=7)
	dateOldTime00 = datetime.combine(dateOnlyOld, timeOnly_00) - timedelta(seconds=(60)*30)
	timeStampStartOld = datetime.timestamp(dateOldTime00)
	timeStampStartOld = str(int(timeStampStartOld))

	dateOldTime99 = datetime.combine(dateOnlyOld, timeOnly_99) - timedelta(seconds=(60)*30)
	timeStampEndOld = datetime.timestamp(dateOldTime99)
	timeStampEndOld = str(int(timeStampEndOld))
	# ------------
	
	response = ss.get('http://10.24.125.226/cacti/graph_xport.php?local_graph_id=36550&rra_id=0&view_type=tree&graph_start=' + timeStampStartNow + '&graph_end=' + timeStampEndNow, stream=True)
	response.raise_for_status()
	with open(fileCsvNow, 'wb') as handle:
		for block in response.iter_content(1024):
			handle.write(block)
			
	response = ss.get('http://10.24.125.226/cacti/graph_xport.php?local_graph_id=36550&rra_id=0&view_type=tree&graph_start=' + timeStampStartOld + '&graph_end=' + timeStampEndOld, stream=True)
	response.raise_for_status()
	with open(fileCsvOld, 'wb') as handle:
		for block in response.iter_content(1024):
			handle.write(block)
	
if os.path.isfile(fileCsvNow) and os.path.isfile(fileCsvOld):
	conn = pyodbc.connect('Driver={SQL Server}; Server=10.24.125.163; Database=PS_CORE_ALL; UID=mdsperformance; PWD=admin*789;')
	
	query = 'delete from dbo.T_Traffic_Gi_Compare_Cacti_Hourly'
	cursor = conn.cursor()
	cursor.execute(query)
	cursor.commit()
	
	noFile = 0
	listFileCsv = [fileCsvNow,fileCsvOld]
	for fileCsv in listFileCsv:
		modeWrite = False
		noFile = noFile + 1
		with open(fileCsv,'r') as fIn:
			lines = fIn.readlines()
			noLine = 0
			# untuk selanjutnya ketika ingin membaca baris cukup menggunakan lines[x] dimana x adalah baris
			while noLine < len(lines):
				barisNow = lines[noLine]
				if modeWrite == True:
					barisNow = barisNow.split(',')
					
					field01 = barisNow[0].replace('"','').replace('-','|').replace(':','|').replace(' ','|').split("|")
					field01 = datetime(int(field01[0]), int(field01[1]), int(field01[2]), int(field01[3]), int(field01[4]), int(field01[5]))
					# # # # # # # ----- case aneh, kalau data today, time nya meleset 5 menit kedepan. jadi menit harus mundur 5 menit kebelakang dari data original cacti
					if noFile == 1: field01 = field01 - timedelta(seconds=(60)*5)
					
					field01_x = str(field01.date())
					field01_y = str(field01.time())[:5]
					field01 = str(field01)
					if barisNow[len(barisNow)-2] != '"NaN"':				
						field02 = barisNow[len(barisNow)-2].replace('"','').replace("e+","|").split("|")
						field02 = "{0:.6f}".format(float(field02[0]) * (10 ** (int(field02[1]) - 9)))
					else:
						break
					
					if barisNow[len(barisNow)-1] != '"NaN"':
						field03 = barisNow[len(barisNow)-1].replace('"','').replace("e+","|").split("|")
						field03 = "{0:.6f}".format(float(field03[0]) * (10 ** (int(field03[1]) - 9)))
					else:
						break
					
					query = "insert into dbo.T_Traffic_Gi_Compare_Cacti_Hourly values('National','"+field01+"','"+field01_x+"','"+field01_y+"','"+field02+"','"+field03+"')"
					cursor = conn.cursor()
					cursor.execute(query)
					

				if len(barisNow) <= 3 and modeWrite == False: 
					modeWrite = True
					noLine = noLine + 1
				noLine = noLine + 1		
			cursor.commit()
	cursor.close()
	conn.close()

