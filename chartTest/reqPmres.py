import configServer as xCS
import dbFunction as fD
import csv


fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ103_neHuawei)

for i in range(0,2):
	for j in range(4,7):
		StrQuery = "select * from tbl_Result_8388830" + str(i) + " where ( [Result time] >='2020-0" + str(j) + "-01' and [Result time] <'2020-0" + str(j + 1) + "-01' ) and ([object name] like '%818%' or [object name] like '%817%' or [object name] like '%838%')"
		# print(StrQuery)
		res =  fD.querySelect(typeConn='source',querySource=StrQuery)		
		with open('pm8388830' + str(i) + '_0' + str(j) + '.csv', 'w', newline='') as f_handle:
			fileOut = csv.writer(f_handle)
			fileOut.writerow( "POOL,NE,DATE,ATTACH,DETECH,TOTAL".split(",") )
			for rx in res:
				fileOut.writerow( rx)


fD.setConnection(typeConn='source',modeConnOnOff='off')

