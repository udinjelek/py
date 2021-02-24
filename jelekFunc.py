def funcGetPathFolder(textInputFunc):
	jFunc = 0
	for iFunc in range(0 ,len(textInputFunc)):
		if textInputFunc[iFunc] == '\\' :  
			jFunc = iFunc 
	return textInputFunc[:jFunc]		
	# input  = r"D:\abc\def\help.exe"
	# result =  'D:\abc\def'

def funcGetFileName(textInputFunc):
	jFunc = 0
	for iFunc in range(0 ,len(textInputFunc)):
		if textInputFunc[iFunc] == '\\' :  
			jFunc = iFunc + 1
	return textInputFunc[jFunc:]
	# input  = r"D:\abc\def\help.exe"
	# result =  'help.exe'

def funcGetFileNameWithoutExt(textInputFunc):
	return funcRemoveExt(funcGetFileName(textInputFunc))
	# input  = r"D:\abc\def\help.exe"
	# result =  'help'		

	
def funcGetExt(textInputFunc):
	jFunc = 0
	for iFunc in range(0 ,len(textInputFunc)):
		if textInputFunc[iFunc] == '.' :  
			jFunc = iFunc + 1
	return textInputFunc[jFunc:]
	# input  = r"D:\abc\def\help.exe"
	# result =  'exe'
	
def funcRemoveExt(textInputFunc):
	jFunc = 0
	for iFunc in range(0 ,len(textInputFunc)):
		if textInputFunc[iFunc] == '.' :  
			jFunc = iFunc
	return textInputFunc[:jFunc]
	# input  = r"D:\abc\def\help.exe"
	# result =  'D:\abc\def\help'
	



# print(funcGetPathFolder(r"D:\abc\def\help.exe"))
# print(funcGetFileName(r"D:\abc\def\help.exe") )
# print(funcGetExt(r"D:\abc\def\help.exe") )
# print(funcRemoveExt(r"D:\abc\def\help.exe") )
# print(funcGetFileNameWithoutExt(r"D:\abc\def\help.exe") )
# print(funcGetPathFolder(r"D:\abc\def\help.exe") + '\\result_' + funcGetFileNameWithoutExt(r"D:\abc\def\help.exe") +  '_001.' + funcGetExt(r"D:\abc\def\help.exe") )


# print(("AuxPiu LNH          BOARD      RF  BP  TX (W/dBm)  VSWR (RL)   RX (dBm) UEs   Sector/AntennaGroup/Cells (State:CellIds:PCIs)").replace(' ',''))