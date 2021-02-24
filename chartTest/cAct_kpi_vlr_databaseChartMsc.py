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
						querySource="select xdate, pool, ne, attach,  total from WEB_VLR_MSC_HW_HR where total > 0 and [xdate] >= CONVERT(varchar(10), GETDATE()-7, 120)      ") 
for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'attach': rx[3], 'total': rx[4], 'system':'huawei'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

fD.setConnection(typeConn='source',modeConnOnOff='on',connectionUse= xCS.connServ52_neEri)
res =  fD.querySelect(	typeConn='source',
						querySource= 	"select time, pool, ne, att_subs, tot_subs from  WEB_VLR_MSC_ER_HR where[time] >= CONVERT(varchar(10), GETDATE()-7, 120) " )
					#	querySource= 	"select time, pool, ne, att_subs, tot_subs from  WEB_VLR_MSC_ER_HR where[time] >= '2020-04-27 21:00' and [time] <'2020-04-28 08:00'  " )


for rx in res:
	datax = {'time': rx[0], 'pool': rx[1], 'msc':rx[2], 'attach': rx[3], 'total': rx[4], 'system':'eri'}
	dfUseKpi = dfUseKpi.append(datax, ignore_index=True)
fD.setConnection(typeConn='source',modeConnOnOff='off')

listMsc = dfUseKpi.msc.unique()
print(listMsc)
i = 1

plt.rcParams["figure.figsize"] = (8,4)
plt.savefig('blank.png')
for mscNow in listMsc: 
	dfPrint = pd.pivot_table(dfUseKpi[dfUseKpi['msc'] == mscNow] , values='attach', index=['time'],  columns=['system','pool','msc'], aggfunc='max')
	columnListNow = list(dfPrint)
	
	lenColumnListNow = len(list(dfPrint))
	
	if lenColumnListNow == 0:
		continue
	
	yDataGraph= [] 
	xDataGraph= dfPrint.index #tanggal
	titleSysGraph = list(dfPrint)[0][0]
	titlePoolGraph= list(dfPrint)[0][1]
	titleMscGraph= list(dfPrint)[0][2]
	plt.title(label='VLR - ' + titlePoolGraph + '\n' + titleMscGraph)
	
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
	plt.savefig('xVLR-' + titleMscGraph + '.png')
	plt.clf()
	plt.cla()
	plt.close()