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

fD.setConnection(typeConn='target',modeConnOnOff='on',connectionUse= xCS.connServ52_neEri)
res =  fD.querySelect(typeConn='target',querySource="select time, pool, ne, [SCR (%)], [call_Attempt (times)], [call_Success (times)]  from  V_WEBCESOC_MSC_ER_SCR_HOURLY where time >= CONVERT(varchar(10), GETDATE()-2, 120)" ) 
for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'scr': rx[3], 'attach': rx[4], 'success': rx[5],'system':'eri'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='target',modeConnOnOff='off')

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

listKpiUse = ['scr','attach','success']
for poolNow in listPool: 
	for kpiUseNow in listKpiUse: 
		dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['pool'] == poolNow] , values=kpiUseNow, index=['time'],  columns=['system','pool','msc'], aggfunc='max')
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
		plt.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05), fancybox=True, shadow=True, ncol=10)
		plt.savefig('BreakEri_SCR-'+kpiUseNow +'-'+ titleSysGraph + '-' +titlePoolGraph+'.png')
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