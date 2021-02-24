def jelek(nilai):
	nilai = str(nilai)

	arrTop=[[" _ "],["   "],[" _ "],[" _ "],["   "],[" _ "],[" _ "],[" _ "],[" _ "],[" _ "],["   "]]
	arrMid=[["| |"],["  |"],[" _|"],[" _|"],["|_|"],["|_ "],["|_ "],["  |"],["|_|"],["|_|"],["   "]]
	arrDwn=[["|_|"],["  |"],["|_ "],[" _|"],["  |"],[" _|"],["|_|"],["  |"],["|_|"],[" _|"],["   "]]
	
	output = ["","",""]
	
	for huruf in nilai:
		if huruf.isdigit():
			output[0]=''.join(output[0]) + ''.join(arrTop[int(huruf)])
			output[1]=''.join(output[1]) + ''.join(arrMid[int(huruf)])
			output[2]=''.join(output[2]) + ''.join(arrDwn[int(huruf)])
		else:
			output[0]=''.join(output[0]) + ''.join(arrTop[10])
			output[1]=''.join(output[1]) + ''.join(arrMid[10])
			output[2]=''.join(output[2]) + ''.join(arrDwn[10])
		
		
	print("\n".join(output))
	

while True:
	dIn = input("\nSilahkan Masukan Input: \n")
	jelek(dIn)