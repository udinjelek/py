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
res =  fD.querySelect(typeConn='source',querySource="select time, ne, attach,  total from V_VLR_HW_HR_RT where total > 0 and [time] >= CONVERT(varchar(10), GETDATE()-3, 120)      " ) 
for rx in res:
	datax = {'time': rx[0],'msc':rx[1], 'attach': rx[2], 'total': rx[3], 'system':'huawei'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='target',modeConnOnOff='on',connectionUse= xCS.connServ52_neEri)
res =  fD.querySelect(typeConn='target',querySource="select time, ne, att_subs, tot_subs from  WEB_VLR_MSC_ER_HR where[time] >= CONVERT(varchar(10), GETDATE()-3, 120)" ) 
for rx in res:
	datax = {'time': rx[0],'msc':rx[1], 'attach': rx[2], 'total': rx[3], 'system':'eri'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='target',modeConnOnOff='off')

start2_time = time.time()
dfMscUse = pd.DataFrame({'msc': dfUseKpi.msc.unique() }) 
dfUseKpi = pd.merge(dfUseKpi, dfDoMsc, on = 'msc')
dfPoolMsc = pd.merge(dfMscUse, dfDoMsc, on = 'msc')
start3_time = time.time()

listPool = dfUseKpi.pool.unique()
print(listPool)

start4_time = time.time()
i = 1

plt.rcParams["figure.figsize"] = (8,4)
plt.savefig('blank.png')
for poolNow in listPool: 
	dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['pool'] == poolNow] , values='attach', index=['time'],  columns=['system','pool','msc'], aggfunc='max')
	columnListNow = list(dfPrint)
	lenColumnListNow = len(list(dfPrint))
	
	yDataGraph= [] 
	xDataGraph= dfPrint.index #tanggal
	titleSysGraph = list(dfPrint)[0][0]
	titlePoolGraph= list(dfPrint)[0][1]
	plt.title(label=titlePoolGraph)
	
	for columnUseNow in columnListNow:
		yDataGraphNow = [ None if x != x else int(x) for x in dfPrint[columnUseNow]] 
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
	plt.savefig('VLR-' + titleSysGraph + '-' +titlePoolGraph+'.png')
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