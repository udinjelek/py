def findNumberBeetweenHereAndThere(textInput,fromTextHere,untilTextHere):
	noFindStart = textInput.find(fromTextHere) 
	noFindEnd =  textInput.find(untilTextHere, noFindStart)
	if noFindStart == -1 or noFindEnd == -1 :
		return ""
	noFindStart += len(fromTextHere)
	noFindEnd =  textInput.find(untilTextHere, noFindStart)
	return textInput[noFindStart:noFindEnd]

dataText = "4G_hourly{yyyy-mm-dd}{hh-17}.csv"
textSearchStart = "{yyyy-mm-dd}{hh-"
textSearchEnd = "}"
print( findNumberBeetweenHereAndThere(dataText,textSearchStart,textSearchEnd))