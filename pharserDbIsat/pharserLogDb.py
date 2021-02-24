import os
import re
directory = os.path.dirname(__file__) + "\\"
if os.path.isdir(directory) == False:
	os.mkdir(directory)

else:
	noLine = 1
	fileOut = open(os.path.join(directory, "OutData.csv"), "w")
	for filename in os.listdir(directory):
		if filename.lower().endswith(".log"):
			fileIn = os.path.join(directory, filename)
			with open(fileIn,'r') as fIn:
				for line in fIn:
					noLine = noLine + 1
					fields = re.split('\s+',line)
					print("00 " + fields[0])
					print("01 " + fields[1])
					fileOut.write(line)
					if noLine > 20:
						break