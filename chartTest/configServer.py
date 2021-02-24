class InfoServer(object):
	driver = ""
	server = ""
	uid = ""
	pwd = ""
	database = ""
	dsn = ""
	def __init__(self ,driver = driver,server = server,uid = uid ,pwd = pwd,database = database, dsn = dsn):
		self.driver = driver
		self.server = server
		self.uid = uid
		self.pwd = pwd
		self.database = database

		self.dsn = dsn #connection for eniq

def fillInfoServer(driver,server,uid,pwd,database,dsn):
	infoServer = InfoServer(driver,server,database,uid,pwd,dsn)
	return infoServer


#------------------------- seting user password untuk koneksi database sql server
connServ100_coreTmp   	=	InfoServer(driver = "{SQL Server}",server = "10.22.254.100", uid = "admin", pwd = "P@ssw0rd", database ="csddb_core_temp")
connServ100_northwind 	=	InfoServer(driver = "{SQL Server}",server = "10.22.254.100", uid = "admin", pwd = "P@ssw0rd", database ="northwind")
connServ100_neHuawei 	= 	InfoServer(driver = "{SQL Server}",server = "10.22.254.100", uid = "admin", pwd = "P@ssw0rd", database ="NE_HUAWEI")
connServ100_neEid 		= 	InfoServer(driver = "{SQL Server}",server = "10.22.254.100", uid = "admin", pwd = "P@ssw0rd", database ="NE_EID")

connServ52_coreReport   = 	InfoServer(driver = "{SQL Server}",server = "10.23.67.52", uid = "admin", pwd = "abrakadabra*5", database ="CORE_REPORTING")
connServ52_neHuawei	    = 	InfoServer(driver = "{SQL Server}",server = "10.23.67.52", uid = "admin", pwd = "abrakadabra*5", database ="NE_HUAWEI")
connServ52_neEri        = 	InfoServer(driver = "{SQL Server}",server = "10.23.67.52", uid = "admin", pwd = "abrakadabra*5", database ="NE_MSC_ER")

connServ103_neHuawei 	= 	InfoServer(driver = "{SQL Server}",server = "10.22.254.103", uid = "admin", pwd = "abrakadabra*5", database ="NE_HUAWEI")
#------------------------- seting user password untuk koneksi database sybase eniq eric, user pass disimpen di ODBC connection.
connServEnixCs			= 	InfoServer(dsn = "eniq_cscore")