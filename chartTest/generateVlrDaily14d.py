import configServer as xCS
import dbFunction as fD
import csv

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ52_coreReport)
res =  fD.querySelect(typeConn='source',querySource="""
																				
													declare @dateStart AS VARCHAR(128)
													declare @dateEnd AS VARCHAR(128)
													set @dateStart = '20200206'
													set @dateEnd   = '20200313'
													set @dateStart   = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()-14 ))
													set @dateEnd   = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE() ) )

													Select *
													from  [v_report_vlr_per_ne_daily_pool]
													where date >=@dateStart and date <@dateEnd and attach >1
													order by date, pool, ne
										
													""")


with open('reportRawDataVlr.csv', 'w', newline='') as f_handle:
	fileOut = csv.writer(f_handle)
	fileOut.writerow( "POOL,NE,DATE,ATTACH,DETECH,TOTAL".split(",") )
	for rx in res:
		fileOut.writerow( rx)