import configServer as xCS
import dbFunction as fD
import csv

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServEnixCs)
res =  fD.querySelect(typeConn='source',querySource="""SELECT OSS_ID,
										ELEM AS NE, CONVERT(VARCHAR,[MAX_DATE],120) AS [DATE], [TABLE],ROWSTATUS,REMARK = 
										CASE WHEN [MAX_DATE] < DATEADD(HOUR,-3,GETDATE()) THEN 'NOK'
										ELSE 'OK' END
										FROM 
										dcpublic._HOUR_UPDATE_MSC
										WHERE ELEM NOT IN ('MSMD2','MSPK1','MSBT1','TSB14','TSDP8','TSB13','TSDP7','TSYG7','TBD11','TBD10','TSSM2','TSJ32','TSJ33','TSJ34','TSJ31','TSLP6','TSPK4','MSJK5')
										ORDER BY [DATE], ELEM, [TABLE]""")


with open('resAlert01 MSC - ENIQ.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "OSS_ID,NE,DATE,TABLE,STATUS,REMARK".split(",") )
	for rx in res:
		fileOut.writerow( rx)

res =  fD.querySelect(typeConn='source',querySource="""SELECT 
										MSC AS NE, MP, CONVERT(VARCHAR,[MAX_DATE],120) AS [DATE], [TABLE],REMARK = 
										CASE WHEN [MAX_DATE] < DATEADD(HOUR,-3,GETDATE()) THEN 'NOK'
										ELSE 'OK' END
										FROM 
										dcpublic._HOUR_UPDATE_TRD
										WHERE MSC NOT IN ('MSMD2','MSPK1','MSBT1') AND MSC NOT LIKE '%MSC-B%' AND MSC NOT LIKE '%MSCBC%' and MP >=  71
										ORDER BY [DATE], MSC, [TABLE]""")


with open('resAlert02 TRD - ENIQ.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "NE,MP,DATE,TABLE,REMARK".split(",") )
	for rx in res:
		fileOut.writerow( rx)

fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ52_neEri)
res =  fD.querySelect(typeConn='source',querySource="""SELECT OSS_ID,
										MGW AS NE, CONVERT(VARCHAR,[MAX_DATE],120) AS [DATE], [TABLE],REMARK = 
										CASE WHEN [MAX_DATE] < DATEADD(HOUR,-3,GETDATE()) THEN 'NOK'
										ELSE 'OK' END
										FROM 
										NE_MSC_ER.dbo._HOUR_UPDATE_MGW
										WHERE MGW NOT IN ('MGPK101','MGPK102','MGBT101','MGSU102','MGTS101','MGPW101') and OSS_ID NOT LIKE '%eniq_oss_1%'
										ORDER BY [MAX_DATE], NE, [TABLE]""")

with open('resAlert03 MGW - ERIC.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "OSS_ID,NE,DATE,TABLE,REMARK".split(",") )
	for rx in res:
		fileOut.writerow( rx)

res =  fD.querySelect(typeConn='source',querySource="""SELECT 
										NE, CONVERT(VARCHAR,[MAX_DATE],120) AS [DATE], [TABLE],REMARK = 
										CASE WHEN [MAX_DATE] < DATEADD(HOUR,-4,GETDATE()) THEN 'NOK'
										ELSE 'OK' END
										FROM 
										NE_MSC_ER.dbo._HOUR_UPDATE_SQS_MANUAL
										ORDER BY [MAX_DATE], NE, [TABLE]""")

with open('resAlert04 SQSMANUAL - ERIC.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "NE,DATE,TABLE,REMARK".split(",") )
	for rx in res:
		fileOut.writerow( rx)

fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ52_neHuawei)
res =  fD.querySelect(typeConn='source',querySource="""SELECT 
										NE, CONVERT(VARCHAR,[MAX_DATE],120) AS [DATE], [TABLE],REMARK = 
										CASE WHEN [MAX_DATE] < DATEADD(HOUR,-4,GETDATE()) THEN 'NOK'
										ELSE 'OK' END
										FROM 
										NE_HUAWEI.dbo._HOUR_UPDATE_HUAWEI
										ORDER BY [MAX_DATE], NE, [TABLE]""")

with open('resAlert05 HUAWEI - HW.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "NE,DATE,TABLE,REMARK".split(",") )
	for rx in res:
		fileOut.writerow( rx)
fD.setConnection(typeConn='source',modeConnOnOff='off')