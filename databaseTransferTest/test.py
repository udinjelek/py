import configServer as xCS
import transferFunction as fT

fT.execQuery(connectionSource=xCS.connServ100_northwind, querySource="delete from T_TIME_RELOAD_SCHEDULE", modeConnOnOff='auto')

fT.transferConnection(typeConn='source', modeConnOnOff='on', connectionUse= xCS.connServ100_coreTmp)
fT.transferConnection(typeConn='target', modeConnOnOff='on', connectionUse= xCS.connServ100_northwind)

fT.transferTableWithAddition( connectionSource= xCS.connServ100_coreTmp 
							, connectionTarget= xCS.connServ100_northwind
							, tableViewSource= 'T_TIME_RELOAD_SCHEDULE'
							, tableViewTarget= 'T_TIME_RELOAD_SCHEDULE' 
							, modeConnOnOff= 'manual'
							, addtionQuery= " where s_time >= '20191229' " )

fT.transferConnection(typeConn='source', modeConnOnOff='off')
fT.transferConnection(typeConn='target', modeConnOnOff='off')


fT.transferTableWithFullQuery(connectionSource= xCS.connServ100_coreTmp
							, connectionTarget= xCS.connServ100_northwind
							, querySource="select * from T_TIME_RELOAD_SCHEDULE where s_time >= '20191229'"
							, tableViewTarget='T_TIME_RELOAD_SCHEDULE' 
							, modeConnOnOff='auto')

fT.transferTableWithAddition( connectionSource= xCS.connServEnixCs 
                        	, connectionTarget= xCS.connServ100_northwind
							, tableViewSource='T_TIME_RELOAD_SCHEDULE'
							, tableViewTarget='T_TIME_RELOAD_SCHEDULE' 
							, modeConnOnOff='auto'
							, addtionQuery=" where s_time >= '20191229' " )
