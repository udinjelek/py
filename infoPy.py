# ============================================================================
# String - Operation

text = " Hello World "
print(text)
text = "1234567890abcdfghijklmnopqrstuvwxyz"

print(text[2:5]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = 345

print(text[:5]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = 12345

print(text[5:]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = 67890abcdfghijklmnopqrstuvwxyz

print(text[-5:]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = vwxyz

print(text[:-5]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = 1234567890abcdfghijklmnopqrstu

print(text[7]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = 8

print(text[-7]) 
# text = "1234567890abcdfghijklmnopqrstuvwxyz"
# out = t

print(len(text))

# textFindAndReplace -----
text = 'Hello=World=Cup'
text = text.replace("=",", ")
# out = Hello, World, Cup, 

# textToArray -----
# text awal adalah string, text berikutnya berbentuk list array yang dipisah dari string berdasarkan symbol '='
text = 'Hello=World=Cup'
text = text.split("=")




# ============================================================================
# Control - Operation

text = "01 Hello"
if len(text) > 3:
	print(text)
	
	if len(text) == 30:
		text ="02 Hello"
	elif len(text) <= 30:
		text ="02 World"
	else:
		text ="02 Cup"
	
	print(text)
	
	
# ============================================================================
# List - Array Operation

textIn = []
textIn.append(True)
textIn.append(False)
textIn.append(False)
textIn.append(True)
textIn.append(False)
textIn.append('Knight')
textIn.append('Monster')
textIn.remove('Knight')

# arrayToText
thislist = ["apple","banana","cherry"]
seperator = ',~~~~ ~'
print(seperator.join(thislist))
# out = "apple,~~~~ ~banana,~~~~ ~cherry"

# findIndexArray
thislist = ["apple", "banana", "cherry"]
print(thislist.index('cherry'))
# out = 2



# ============================================================================
# For Loop - Operation

for character in 'hello':
	print(character)
	# can use list array instead string
print('end of loop')

	
for i in range(5, 8):
	print(i)
print('end of loop')

for j in range(4):
	print(i)
print('end of loop')

# ============================================================================
# While Loop - Operation
i = 1
while i < 6:
	print(i)
	if i == 3:
		break
	i += 1
	
print('end of loop')
# out = 1 2 3 end of loop . 

i = 0
while i < 6:
	i += 1
	if i == 3:
		continue
	print(i)
	
print('end of loop')
# out = 1 2 4 5 6 end of loop . 3 will skip

# ============================================================================
# Read File - Operation 
# Readlines Method + while loop 
fileIn = 'C:\\dataIn\\test.txt'
with open(fileIn,'r') as fIn:
	lines = fIn.readlines()
	noLine = 0
	# untuk selanjutnya ketika ingin membaca baris cukup menggunakan lines[x] dimana x adalah baris
	while noLine < len(lines):
		barisNow = lines[noLine]
		noLine = noLine + 1

# Write 
textError = "Hai \n test"
fileLogError = open('C:\\dataIn\\test.txt', "a")	
fileLogError.write(textError)
fileLogError.write("\n")
fileLogError.write(textError)
fileLogError.close()

