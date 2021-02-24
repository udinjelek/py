def tukarArrData(arrData,noIndex1,noIndex2):
	tmp = arrData[noIndex1]
	arrData[noIndex1] = arrData[noIndex2]
	arrData[noIndex2] = tmp
	
def checkRotation(arrData):
	i = 0
	for i in range(len(arrData)-1,0,-1):
		if int(arrData[i]) > int(arrData[i - 1]):
			i = i -1
			break 
	iSwitch = 0
	delta = 0
	
	for x in range(len(arrData)-1,i,-1):
		if int(arrData[x]) > int(arrData[i]) :
			if delta == 0 or delta > (int(arrData[x]) - int(arrData[i]) ):
				delta = (int(arrData[x]) - int(arrData[i]) )
				iSwitch = x
				
				
	tukarArrData(arrData,i,iSwitch)
	
	tmp = []
	for x in range(len(arrData)-1,i,-1):
		tmp.append(arrData[x])
		tmp.sort(reverse= True)
	y = 0
	for x in range(len(arrData)-1,i,-1):
		arrData[x] = tmp[y]
		y = y + 1
	return arrData  
	
def checkDataIsMax(arrData):
	answer = True
	for i in range(0,len(arrData) - 1):
		if arrData[i] < arrData[i +1]:
			answer = False
			break
	return answer
	
def next_bigger(n):
	output = []	
	arrData = list(str(n))
	if checkDataIsMax(arrData) == True : return -1
	return int(''.join(checkRotation(arrData)))
	

print(next_bigger(21))