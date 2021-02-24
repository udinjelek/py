import configServer as xCS
import dbFunction as fD
import pandas as pd
import time
import matplotlib.pyplot as plt

start_time = time.time()

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ52_coreReport)
res =  fD.querySelect(typeConn='source',querySource='select msc, pool from do_msc group by msc, pool')
dfDoMsc = pd.DataFrame()
for rx in res:
	datax = {'msc': rx[0],'pool':rx[1]}
	dfDoMsc = dfDoMsc.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')


#------------------------
dfUseKpi = pd.DataFrame()

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServ52_neHuawei)
res =  fD.querySelect(	typeConn='source',
						querySource=""" SELECT    
										XDATE 
										,POOL 
                                        ,NE
										,[ASR_TOT] 
										,[TRAFFIC_TOTAL] 
										FROM  
										dbo.[WEB_ASR_MSC_HW_HR]  
										WHERE [XDATE] >= CONVERT(varchar(10), GETDATE()-7, 120) 
										
										AND NE LIKE 'M%'  """ ) 
for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'asr': rx[3], 'Traff': rx[4],  'system':'huawei'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServEnixCs)
res =  fD.querySelect(	typeConn='source',
						querySource= 	"""	SELECT 
											[TIME],  
											POOL =  
												CASE WHEN ELEM1 IN ('MSJ24','MSJ25','MSJ26','MSJ28','MSJ30','MSJ35') THEN 'Jabo Pool'  
												WHEN ELEM1 IN ('MSB12','MSJE2','MSMA1','MSSB9') THEN 'East Java Pool'  
												WHEN ELEM1 IN ('MSSM2','MSTG2','MSWL1','MSYG5') THEN 'Central Java Pool'  
												WHEN ELEM1 IN ('MSDP5','MSDP6','MSSG3') THEN 'Balomsum Pool'  
												WHEN ELEM1 IN ('MSBD7','MSBD8','MSCH1','MSCI2') THEN 'West Java Pool'  
											WHEN ELEM1 IN ('TSB11','TSBD9','TSJ29','TSYG6') THEN 'New CMN'  
											WHEN ELEM1 IN ('TSB13','TSB14','TBD10','TBD11','TSDP7','TSDP8','TSJ31','TSJ32','TSJ33','TSJ34','TSPK4','TSLP6','TSSM2','TSYG7') THEN 'Old CMN'  
											WHEN ELEM1 IN ('TSSB7','TSBD3') THEN 'Transit'  
												else 'Non Pool'  
											end,  
											ELEM1 as NE,
											100*(SUM(NANSWERSI+NANSWERSO)/NULLIF(SUM(NCALLSI+NCALLSO),0)) AS ASR_TOTAL ,
											sum(TRAFF_TOT) AS TRAFF_TOT
											FROM  
											(  
												SELECT distinct ELEM1, [TIME], MO, ASR_IN, ASR_OUT, ASR_TOT = (ASR_IN+ASR_OUT)/2, TRAFF_IN, TRAFF_OUT, TRAFF_TOT, NANSWERSI, NANSWERSO, NCALLSI, NCALLSO, NOVERFLOWI, NOVERFLOWO, NTRALACCI, NTRALACCO,NSCAN, LASTCONGCNT, TRUNK_UTIL 
												FROM  
												_TRUNKROUTE  
												WHERE [TIME] >=  DATEFORMAT(GETDATE()-7, 'YYYY-MM-DD')
												
												AND RPL = 60  
												AND BC = ''  
											) X  
											GROUP BY ELEM1, [TIME] 
											ORDER BY [TIME],POOL,ELEM1""" )



for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'asr': rx[3], 'Traff': rx[4], 'system':'eri'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

start2_time = time.time()
dfMscUse = pd.DataFrame({'msc': dfUseKpi.msc.unique() }) 
dfUseKpi = dfUseKpi
dfPoolMsc = pd.merge(dfMscUse, dfDoMsc, on = 'msc')
start3_time = time.time()

listPool = dfUseKpi.pool.unique()
print(listPool)

start4_time = time.time()
i = 1

plt.rcParams["figure.figsize"] = (8,4)
plt.savefig('blank.png')
for poolNow in listPool: 
	dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['pool'] == poolNow] , values='asr', index=['time'],  columns=['system','pool','msc'], aggfunc='max')
	columnListNow = list(dfPrint)
	lenColumnListNow = len(list(dfPrint))
	
	yDataGraph= [] 
	xDataGraph= dfPrint.index #tanggal
	titleSysGraph = list(dfPrint)[0][0]
	titlePoolGraph= list(dfPrint)[0][1]
	plt.title(label='ASR - ' + titlePoolGraph)
	
	for columnUseNow in columnListNow:
		yDataGraphNow = [ None if x != x else float(x) for x in dfPrint[columnUseNow]] 
		yDataGraph.append( yDataGraphNow)
		plt.plot( xDataGraph,yDataGraphNow, '.-', label=columnUseNow[2])
		
	
	i = i + 1
	
	
	ax = plt.subplot(111)
	ax.spines["top"].set_visible(False)
	ax.spines["right"].set_visible(False)
	ax.grid(b=True, which='major', linestyle='--',axis='y',color="black", alpha=0.2)
	ax.get_xaxis().tick_bottom()
	ax.get_yaxis().tick_left()
	
	plt.xticks(fontsize = 7)
	plt.yticks(fontsize = 7)
	plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05), fancybox=True, shadow=True, ncol=5)
	plt.savefig('xASR-' + titleSysGraph + '-' +titlePoolGraph+'.png')
	plt.clf()
	plt.cla()
	plt.close()

start5_time = time.time()
start6_time = time.time()

print("--- %s seconds ambil data---" % (start2_time- start_time))
print("--- %s seconds combine---" % (start3_time - start_time))
print("--- %s seconds distinct---" % (start4_time - start_time))
print("--- %s seconds method1---" % (start5_time - start4_time))
print("--- %s seconds method2---" % (start6_time - start5_time))
print("--- %s seconds pecah---" % (time.time() - start_time))