

def convertJelek(textInput):
	textInput= textInput.lower()
	textInput= textInput.replace("o","a")
	textInput= textInput.replace("i","a")
	textInput= textInput.replace("u","a")
	textInput= textInput.replace("e","a")
	
	textInput=textInput.split("a")
	totalMax = 0
	for kata in textInput:
		dataNow = 0
		if len(kata)>0 :
			for huruf in kata:
				noChar = (ord(huruf) - 96)
				if noChar > 1 and noChar < 27:
					dataNow = dataNow + noChar
			if dataNow > totalMax:
				totalMax = dataNow
	print(totalMax)
	return (totalMax)


convertJelek("aBcaiueoxYz")

	