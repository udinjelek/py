s = "1102021222"
k = 2
result = 0

def kataCheck(kata, k):
	output= [0,0,0,0,0,0,0,0,0,0]
	for y in range (0 , 10):
		for x in range(0,len(kata)):
			if kata[x] == str(y):
				output[y] =  output[y] + 1
	
	hasil = True
	for y in range (0 , 10):
		if output[y] != k and output[y] != 0:
			hasil = False
	
	
	print("output ",output, hasil)
	return hasil 
	
	
for i in range(0,len(s)):
	for j in range(i, len(s)):
		print(i,j,s[i:j+1])
		if kataCheck( s[i:j+1] , k ) == True: 
			
			result = result + 1
			print ("hasil ", result)
print (result)
		

			
		
	
	
		
		
		