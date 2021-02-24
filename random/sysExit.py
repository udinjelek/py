import sys
import os
import datetime

def is4firstNumberText(textFunc):
	resultFunc = True
	if textFunc[0:4].isdigit() == False: resultFunc = False
	# if textFunc[1:2].isdigit() == False: resultFunc = False
	# if textFunc[2:3].isdigit() == False: resultFunc = False
	# if textFunc[3:4].isdigit() == False: resultFunc = False
	return resultFunc



a = datetime.datetime.now()
x = 0
print("startTime",a)
for i in range(1,10):
	for j in range(1,10):
		for k in range(1,10):
			x = x + 1

b = datetime.datetime.now()
print(b)
print(b-a)
print(14321,1000,14321%1000,14000%1000)
textFunc = "abcddddddx[10000000000000000]"
print(textFunc.find("["))
textFunc = textFunc[:textFunc.find("[")] 	
print (textFunc)





textIn = "MCE             1:Machine Check   =OK    Test OK"
textIn = textIn.split("=")
# lentextIn
textIn01 = textIn[0]
textIn01 = (textIn01.replace(" ",""))
textIn01 = (textIn01.replace(":",""))
textIn01 = "".join("" if arrIndex.isdigit() else arrIndex for arrIndex in textIn01)

textIn01 = "20a9-01-23"




textIn = []
textIn.append(True)
textIn.append(False)
textIn.append(False)
textIn.append(True)
textIn.append(False)

# print(is4firstNumberText(textIn01))
# print(textIn01[3:4])
print(textIn.index(False))
sys.exit()
print("200")