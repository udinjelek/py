import configServer as xCS
import dbFunction as fD
import pandas as pd
import time
import matplotlib.pyplot as plt

start_time = time.time()

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse = xCS.connServ52_coreReport)
res =  fD.querySelect(typeConn='source',querySource='select mgw, pool from do_mgw group by mgw, pool')
dfDoMgw = pd.DataFrame()
for rx in res:
	datax = {'mgw': rx[0],'pool':rx[1]}
	dfDoMgw = dfDoMgw.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')


#------------------------
dfUseKpi = pd.DataFrame()

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServ52_neHuawei)
res =  fD.querySelect(	typeConn='source',
						querySource=""" SELECT    
										TIME,
										NE,
										SCC_USAGE,
										CURR_TRAFF_LOAD
										FROM  
										dbo.[V_WEBCESOC_MGW_HW_SCC_USAGE_HOURLY]  
										WHERE [TIME] >= CONVERT(varchar(10), GETDATE()-7, 120) 
										  """ ) 
for rx in res:
	datax = {'time': rx[0],'mgw':rx[1], 'scc': rx[2], 'Traff': rx[3],  'system':'huawei'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

	# [TIME] >=  DATEFORMAT(GETDATE()-2, 'YYYY-MM-DD')
												# and [TIME] <  DATEFORMAT(GETDATE()-0, 'YYYY-MM-DD')
fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServ52_neEri)
res =  fD.querySelect(	typeConn='source',
						querySource= 	"""	SELECT 
										TIME,
										NE,
										SCC_USAGE,
										CURR_TRAFF_LOAD
										FROM  
										dbo.[REPORT_SCC_USAGE_HOURLY]  
										WHERE [TIME] >= CONVERT(varchar(10), GETDATE()-7, 120) 
											""" )

for rx in res:
	datax = {'time': rx[0],'mgw':rx[1], 'scc': rx[2], 'Traff': rx[3], 'system':'eri'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

dfUseKpi = pd.merge(dfUseKpi, dfDoMgw, on = 'mgw')

listMgw = dfUseKpi.mgw.unique()
listPool = dfUseKpi.pool.unique()

i = 1

plt.rcParams["figure.figsize"] = (8,4)
plt.savefig('blank.png')

listKpiUse = ['scc','Traff']
for poolNow in listPool: 
	for kpiUseNow in listKpiUse: 
		dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['pool'] == poolNow] , values=kpiUseNow, index=['time'],  columns=['system','pool','mgw'], aggfunc='max')
		columnListNow = list(dfPrint)
		lenColumnListNow = len(list(dfPrint))
		
		yDataGraph= [] 
		xDataGraph= dfPrint.index #tanggal
		titleSysGraph = list(dfPrint)[0][0]
		titlePoolGraph= list(dfPrint)[0][1]
		plt.title(label=kpiUseNow + ' ' + titlePoolGraph)
		
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
		plt.savefig('z'+kpiUseNow +'-'+ titleSysGraph + '-' +titlePoolGraph+'.png')
		plt.clf()
		plt.cla()
		plt.close()

for mgwNow in listMgw:
	for kpiUseNow in listKpiUse: 
		dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['mgw'] == mgwNow] , values=kpiUseNow, index=['time'],  columns=['system','pool','mgw'], aggfunc='max')
		columnListNow = list(dfPrint)
		lenColumnListNow = len(list(dfPrint))
		
		yDataGraph= [] 
		xDataGraph= dfPrint.index #tanggal
		titleSysGraph = list(dfPrint)[0][0]
		titlePoolGraph= list(dfPrint)[0][1]
		titleMgwGraph= list(dfPrint)[0][2]
		plt.title(label= kpiUseNow +' - ' + titlePoolGraph + '\n' + titleMgwGraph)
		
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
		plt.savefig('z'+ kpiUseNow +'-' + titleMgwGraph + '.png')
		plt.clf()
		plt.cla()
		plt.close()
