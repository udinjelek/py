def tukarArrData(arrData,noIndex1,noIndex2):
	tmp = arrData[noIndex1]
	arrData[noIndex1] = arrData[noIndex2]
	arrData[noIndex2] = tmp
	
arrData = ['apel','kucing','bola','monster','air','api']
def loopPermutation(arrData,noSwitch, maxNoSwitch):
	if noSwitch < maxNoSwitch:
		for i in range(noSwitch,maxNoSwitch+1):
			tukarArrData(arrData,i,noSwitch)
			loopPermutation(arrData,noSwitch + 1, maxNoSwitch)	
			tukarArrData(arrData,noSwitch,i)
	if noSwitch == maxNoSwitch:
		print('loop',arrData)
		
		

loopPermutation(arrData,0,len(arrData)-1)