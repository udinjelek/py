import pyodbc

connSource = ""
cursorSource = ""

connTarget = ""
cursorTarget = ""

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------
def getIteration(listTarget,listSource):
	xListSource = frozenset(listSource)
	return [x for x in listTarget if x.lower() in  map(str.lower,xListSource)]

def printQuestionMark(countQuestion):
	if countQuestion> 1: 
		return '?,' *(countQuestion-1) + '?'
		## jika countQuestion = 5 maka output adalah ?,?,?,?,? | jika countQuestion = 2 maka output adalah ?,?
	else:
		return '?'

#=====================================================================================================================================================================
def execQuery(connectionSource,querySource,modeConnOnOff):
	global connSource
	global cursorSource
	
	if modeConnOnOff == 'auto':
		connInfo = connectionSource 
		if  connInfo.dsn != "":
			connSource = pyodbc.connect('DSN=' + connInfo.dsn)
		else:
			connSource = pyodbc.connect('Driver='+connInfo.driver+'; Server='+connInfo.server+'; Database='+connInfo.database+'; UID='+connInfo.uid+'; PWD='+connInfo.pwd+';')
		cursorSource = connSource.cursor()
	
	cursorSource.execute(querySource)
	cursorSource.commit()

	if modeConnOnOff == 'auto':
		cursorSource.close()
		connSource.close()

#-----------------
# child dari TRANSFER function, fungsi untuk memanggil main function		
def transferTableAll(connectionSource,connectionTarget,tableViewSource,tableViewTarget,modeConnOnOff):
	transferTableQueryMasterMode(connectionSource=connectionSource
								,connectionTarget=connectionTarget
								,tableViewSource=tableViewSource
								,tableViewTarget=tableViewTarget
								,modeConnOnOff=modeConnOnOff)

# child dari TRANSFER function, fungsi untuk memanggil main function
def transferTableWithAddition(connectionSource,connectionTarget,tableViewSource,tableViewTarget,modeConnOnOff,addtionQuery):
	transferTableQueryMasterMode(connectionSource=connectionSource
								,connectionTarget=connectionTarget
								,tableViewSource=tableViewSource
								,tableViewTarget=tableViewTarget
								,addtionQuery=addtionQuery
								,modeConnOnOff=modeConnOnOff)

# child dari TRANSFER function, fungsi untuk memanggil main function
def transferTableWithFullQuery(connectionSource,connectionTarget,querySource,tableViewTarget,modeConnOnOff):
	transferTableQueryMasterMode(connectionSource=connectionSource
	                            ,connectionTarget=connectionTarget
								,tableViewTarget=tableViewTarget
								,modeConnOnOff=modeConnOnOff
								,querySource=querySource)

# main dari TRANSFER function
def transferTableQueryMasterMode(connectionSource='',connectionTarget='',tableViewSource='',tableViewTarget='',addtionQuery='',modeConnOnOff='',querySource=''):
	tableSource = tableViewSource
	tableTarget = tableViewTarget
	global connSource
	global connTarget
	global cursorSource
	global cursorTarget

	if modeConnOnOff == 'auto':
		connInfo = connectionSource 
		if  connInfo.dsn != "":
			connSource = pyodbc.connect('DSN=' + connInfo.dsn)
		else:
			connSource = pyodbc.connect('Driver='+connInfo.driver+'; Server='+connInfo.server+'; Database='+connInfo.database+'; UID='+connInfo.uid+'; PWD='+connInfo.pwd+';')
		cursorSource = connSource.cursor()

		connInfo = connectionTarget 
		connTarget = pyodbc.connect('Driver='+connInfo.driver+'; Server='+connInfo.server+'; Database='+connInfo.database+'; UID='+connInfo.uid+'; PWD='+connInfo.pwd+';')
		cursorTarget = connTarget.cursor()

	if tableSource != '': 
		connInfo = connectionSource 
		if  connInfo.dsn != "":
			querySource = "Select column_name from systabcol key join systab  where table_name = '"+ tableSource +"'"
		else:
			querySource = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+ tableSource +"' ORDER BY ORDINAL_POSITION"
		result = cursorSource.execute(querySource)
		fieldSource = [r[0] for r in result]
	else:
		tableSource = " ("+ querySource +") xx "
		querySource = "SELECT TOP 0 xx.* from ("+ querySource +") xx"
		result = cursorSource.execute(querySource)
		fieldSource = [column[0] for column in cursorSource.description]
		
	queryTarget = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '"+ tableTarget +"' ORDER BY ORDINAL_POSITION"
	result = cursorTarget.execute(queryTarget)
	fieldTarget = [r[0] for r in result]

	fieldUse = getIteration(fieldTarget,fieldSource)
	fieldSymbol = printQuestionMark(len(fieldUse))
	fieldUse = "["+ "],[".join(fieldUse) + "]"

	querySource = "select " + fieldUse + " from " + tableSource + " " + addtionQuery 
	#print("query adalah ",querySource)
	cursorSource.execute(querySource)

	insertQueryStatus = 'ongoing'
	insertRowCount = 0

	while insertQueryStatus == 'ongoing':
		dataSelect = cursorSource.fetchmany(500)
		insertNowDatas = []
		
		if dataSelect == []:
			insertQueryStatus = 'done'
			break

		for data in dataSelect:
			insertRowCount = insertRowCount + 1
			insertNowDatas.append(data)
			
		cursorTarget.executemany( 	"INSERT INTO [" + tableTarget + "] (" + fieldUse + ")"
									"VALUES (" + fieldSymbol + ")" 
								, insertNowDatas)

		cursorTarget.commit()

	if modeConnOnOff == 'auto':
		cursorTarget.close()
		connTarget.close()

		cursorSource.close()
		connSource.close()

# function untuk menyalakan atau mematikan koneksi ke database. 
def setConnection(typeConn='source',modeConnOnOff='on',connectionUse = ""):
	global connSource
	global connTarget
	global cursorSource
	global cursorTarget
	if modeConnOnOff == 'on' and typeConn == 'source':
		connInfo = connectionUse 
		if  connInfo.dsn != "":
			connSource = pyodbc.connect('DSN=' + connInfo.dsn)
		else:
			connSource = pyodbc.connect('Driver='+connInfo.driver+'; Server='+connInfo.server+'; Database='+connInfo.database+'; UID='+connInfo.uid+'; PWD='+connInfo.pwd+';')
		cursorSource = connSource.cursor()
	if modeConnOnOff == 'on' and typeConn == 'target':
		connInfo = connectionUse 
		connTarget = pyodbc.connect('Driver='+connInfo.driver+'; Server='+connInfo.server+'; Database='+connInfo.database+'; UID='+connInfo.uid+'; PWD='+connInfo.pwd+';')
		cursorTarget = connTarget.cursor()

	if modeConnOnOff == 'off' and typeConn == 'source':
		cursorSource.close()
		connSource.close()	
	if modeConnOnOff == 'off' and typeConn == 'target':
		cursorTarget.close()
		connTarget.close()

def querySelect(typeConn='source',querySource=""):
	global connSource
	global connTarget
	global cursorSource
	global cursorTarget
	result  = ''
	if typeConn =='source': result = cursorSource.execute(querySource)
	if typeConn =='target': result = cursorTarget.execute(querySource)
	return result