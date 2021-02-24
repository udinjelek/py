def simplify(poly):
	lenText = len(poly)
	output = []
	text = ""
	for i in poly:
		if str(i) == "+" or str(i) == "-" :
			if text!= "" : 
				calculateAndAppendData( cleanData(text) , output)
				text = ""
				
		text = text + str(i)
	if text!= "": calculateAndAppendData( cleanData(text) , output)
	sortOutput(output)
	output = printOutput(output)
	return output

def printOutput(output):
	strOutput = ""
	for i in range(0, len(output)):
		if output[i][0] == 1 : value = ""
		if output[i][0] == -1 : value = "-"
		if output[i][0] >1 or output[i][0] < -1 : value = output[i][0]

		if output[i][0] > 0: strOutput = strOutput + "+" + str(value) + output[i][1]
		if output[i][0] < 0: strOutput = strOutput + "" +  str(value) + output[i][1]	
		
	if strOutput[:1] == "+" : strOutput = strOutput[1:]
	return strOutput

def sortOutput(output):
	output.sort(key=lambda x: x[1], reverse=False)
	output.sort(key=lambda x: x[2], reverse=False)

def calculateAndAppendData(dataInput,output):
	find = False
	for i in range(0, len(output)):
		if output[i][1] ==  dataInput[1]:
			find = True
			output[i][0] = output[i][0] + dataInput[0]
			break
	
	if find == False:
		output.append(dataInput)
			
def cleanData(text):
	textTmp = ""
	outputPerLine = [1,"",0]
	for i in text:
		if ord(str(i).lower()) >= 97 and ord(str(i).lower()) <= 122:
			if outputPerLine[2] == 0: 
				if textTmp == "-" : 
					outputPerLine[0] = -1
				elif textTmp == "+" : 
					outputPerLine[0] = 1
				elif textTmp != "" : 
					outputPerLine[0] = int(textTmp)
				textTmp = ""
			outputPerLine[2] = outputPerLine[2] + 1
		textTmp = textTmp + str(i)
	outputPerLine[1]= sortTypeObj(textTmp)
	return outputPerLine

def sortTypeObj(text):
	arrText = list(text)
	arrText.sort()
	return ''.join(arrText)


simplify("dc+dcba")
simplify("2xy-yx")
simplify("-a+5ab+3a-c-2a")
simplify("-abc+3a+2ac")
simplify("xyz-xz")
simplify("3abc-2bca+3x-5x")

