fileIn = 'test.txt'
dataReverse = []
#Read Data
with open(fileIn,'r') as fIn:
	lines = fIn.readlines()
	dataReverse = reverseListEachSub(lines)
dataReverse.sort()
lines = reverseListEachSub(lines)
fileWrite = open('testReverse.txt', "w")	
for noLine in range(0, len(lines)):


def reverseListEachSub(listArr):
	for noLine in range(0, len(listArr)):
		listArrBreak = listArr[noLine].replace("\n","").split(" ")	
		dataReverseBreak = listArrBreak[::-1]
		dataReverse.append ( " ".join(dataReverseBreak))
	return dataReverse