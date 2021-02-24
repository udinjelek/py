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
						querySource=""" select 
										XDATE, 
										POOL, 
										NE, 
										SCR_MONITORING, 
										[call attempt times (times)] 
										from 
										WEB_SCR_MSC_HW_HR 
										WHERE [XDATE] >= CONVERT(varchar(10), GETDATE()-6, 120) 
										"""  ) 
for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'scr': rx[3], 'att': rx[4],  'system':'huawei'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServ52_neEri)
res =  fD.querySelect(	typeConn='source',
						querySource= 	"""	SELECT 
											[date],  
											POOL = 
												CASE WHEN MSC IN ('MSJ24','MSJ25','MSJ26','MSJ28','MSJ30','MSJ35') THEN 'Jabo Pool' 
												WHEN MSC IN ('MSB12','MSJE2','MSMA1','MSSB9') THEN 'East Java Pool' 
												WHEN MSC IN ('MSSM2','MSTG2','MSWL1','MSYG5') THEN 'Central Java Pool' 
												WHEN MSC IN ('MSDP5','MSDP6','MSSG3') THEN 'Balomsum Pool' 
												WHEN MSC IN ('MSBD7','MSBD8','MSCH1','MSCI2') THEN 'West Java Pool' 
												WHEN MSC IN ('TSB11','TSBD9','TSJ29','TSYG6') THEN 'New CMN' 
												WHEN MSC IN ('TSB13','TSB14','TBD10','TBD11','TSDP7','TSDP8','TSJ31','TSJ32','TSJ33','TSJ34','TSPK4','TSLP6','TSSM2','TSYG7') THEN 'Old CMN' 
												WHEN MSC IN ('TSSB7','TSBD3') THEN 'Transit' 
												else 'Non Pool' 
											end, 
											msc as NE,
											SCR = case when 100*(sum(SUCCESS)/NULLIF(sum(NCALLS),0)) > 100 then 100 else  100*(sum(SUCCESS)/NULLIF(sum(NCALLS),0)) end, 
                                                                                       
											sum(NCALLS) AS CALL_ATTEMPT
											FROM  
											[SCR_RT]
											WHERE [date] >=  CONVERT(varchar(10), GETDATE()-6, 120) 
											GROUP BY msc, date 
											""" )



for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'scr': rx[3], 'att': rx[4], 'system':'eri'}
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
	dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['pool'] == poolNow] , values='scr', index=['time'],  columns=['system','pool','msc'], aggfunc='max')
	columnListNow = list(dfPrint)
	lenColumnListNow = len(list(dfPrint))
	
	yDataGraph= [] 
	xDataGraph= dfPrint.index #tanggal
	titleSysGraph = list(dfPrint)[0][0]
	titlePoolGraph= list(dfPrint)[0][1]
	plt.title(label='SCR - ' + titlePoolGraph)
	
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
	plt.savefig('xSCR-' + titleSysGraph + '-' +titlePoolGraph+'.png')
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