# textIn = 'ABC'
# levelMax = len(textIn) - 1
# levelIn = 0

# def permutasiJelek():
	# for i in range(levelIn,levelMax):
		# swap( levelIn ,y):
	
	
	
# def swap(x,y):
	# global textIn
	# arrTmp = list(textIn)
	# tmp = arrTmp[x]
	# arrTmp[x] = arrTmp[y]
	# arrTmp[y] = tmp
	# textIn = ''.join(arrTmp)
	
# swap(0,2)
# print(textIn)
# swap(0,2)
# print(textIn)


# ------------

def encode(n,strng):
	return coding(strng, n, -1,['A','B'])

def decode(strng):
	n = int(strng.split(" ")[0])
	strng = strng.split(" ")
	del strng[0]
	strng = " ".join(strng)
	return coding(strng,n, 1,['B','A'])
	
def shiftText(textIn,noShift,mode):
	if len(textIn)==0: return textIn
	noShift = noShift  % len(textIn)
	textTmp = textIn + textIn
	if mode == 1: textIn = textTmp[noShift :len(textIn) + noShift]
	if mode == -1: textIn = textTmp[len(textIn) - noShift : (len(textIn) * 2) - noShift]
	return textIn

def coding(strng,n,mode,step):
	recordSpace=[]
	for i in range(0,len(strng)):
		if strng[i]==" ": recordSpace.append(i)
	
	for i in range(0,n):
		for stepNow in step:
			# ----
			if stepNow == 'A':
				strng = strng.replace(" ","")
				strng = shiftText(strng,n,mode)
				listNow = list(strng)
				for j in range(0,len(recordSpace)):
					listNow.insert(recordSpace[j]," ")
				
				strng = ''.join(listNow)
			# ----
			if stepNow == 'B':
				listNow = strng.split(" ")
				for j in range(0,len(listNow)):
					listNow[j] = shiftText(listNow[j],n,mode)
				strng = ' '.join(listNow)
	if mode == -1: return  str(n) + ' ' + strng
	if mode ==  1: return  strng



print(encode(14,'abcd efghij'))
print(decode('14 cdab efijgh'))
# print(encode(13,'abcd efghij'))
# print(decode('13 ajib gdcfeh'))
# print(encode(12,'abcd efghij'))
# print(decode('12 ghij abcdef'))
# print(encode(11,'abcd efghij'))
# print(decode('11 abcj efghid'))
# print(encode(10,'abcd efghij'))
# print(decode('10 abcd ghijef'))
# print(encode(9,'abcd efghij'))
# print(decode('9 ebcd ifahgj'))
# print(encode(8,'abcd efghij'))
# print(decode('8 efab cdghij'))
# print(encode(7,'abcd efghij'))
# print(decode('7 cjid gbafeh'))
# print(encode(6,'abcd efghij'))
# print(decode('6 abcd efghij'))
# print(encode(5,'abcd efghij'))
# print(decode('5 efgh ibcdaj'))
# print(encode(4,'abcd efghij'))
# print(decode('4 ijef ghabcd'))
# print(encode(3,'abcd efghij'))
# print(decode('3 ahcj efgdib'))
# print(encode(2,'abcd efghij'))
# print(decode('2 abef cdijgh'))
# print(encode(1,'abcd efghij'))
# print(decode('1 cjab idefgh'))
# print(encode(0,'abcd efghij'))
# print(decode('0 abcd efghij'))

# # Write 
# textError = "Hai \n test"
# fileLogError = open('C:\\dataIn\\test.txt', "a")	
# fileLogError.write("print(decode('")
# fileLogError.write(encode(14,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(13,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(12,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(11,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(10,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(9,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(8,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(7,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(6,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(5,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(4,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(3,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(2,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(1,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.write("print(decode('")
# fileLogError.write(encode(0,'abcd efghij'))
# fileLogError.write("'))")
# fileLogError.write("\n")
# fileLogError.close()


# print(decode('2 Trcr evy. ue i amlidas auunacnebure'))
# print(decode('14 daue ilev is a munbune Traurecracy.'))