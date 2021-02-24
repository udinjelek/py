dataList =  [ 	['d1-00','d1-23'],
				['d2-00','d2-23'],
				['d3-00','d3-23'],
				['d4-00','d4-23'],
				['d5-00','d5-23'],
				['d6-00','d6-23'],
				['d7-00','d7-23']]

valList = [[960923,952205],
[958050,949957],
[963580,953901],
[963815,956090],
[968088,958546],
[967742,960002],
[960072,952616]]



outList = []
outVal  = []
outCombine = []

def loopData(dataList,currentData,currentValue,noList):
	for i in range(len(dataList[noList])):
		if (noList==0):
			outList.append(dataList[noList][i] + ' ' + currentData  )
			outVal.append( currentValue + valList[noList][i] )
			outCombine.append( dataList[noList][i] + ' ' + currentData + ', ' + str(currentValue + valList[noList][i]))
		else:
			loopData(dataList,   dataList[noList][i] + ' ' + currentData ,    currentValue + valList[noList][i],       noList - 1)

loopData(dataList,'',0,6)
# print('\n'.join(outList))
# print('\n\n\n')
# print('\n'.join("'{0}'".format(n) for n in outVal))

print('\n'.join(outCombine))