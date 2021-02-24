def letter_frequency(text):
	lenText = len(text)
	halfLenText = int(lenText / 2) 
	output = False
	for i in range(0,int(halfLenText)):
		ii = i + 1
		if lenText % ii == 0:
			resultConstruction = int(lenText / ii) * text[:ii]
			if text == resultConstruction: 
				output = True
				break
	return text+" "+str(output)
#https://www.codewars.com/kata/character-frequency-1/train/python
 
print( letter_frequency('aabaabaa'))
print( letter_frequency('aabaabaab'))
print( letter_frequency('abababab'))