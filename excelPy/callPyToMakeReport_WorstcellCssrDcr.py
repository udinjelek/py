import urllib.request 
import os
from datetime import datetime, timedelta
dateUse = datetime.today() - timedelta(days=0)
dateUseType1 = (dateUse.strftime("%Y%m%d"))
dateUseType2 = (dateUse.strftime("%Y-%m-%d"))
#print(dateUseType1)
#print(dateUseType2)

headerPath = "http://osspm.indosatooredoo.com:8080/proptima/scheduled_reports/M_Ikhsan/RAW_DATA_DB_DAILY/"

#--- CDR
nameFile = []
nameFile.append("_3G_CDR_CS_Num_Last_14_Days.csv")
nameFile.append("_2G_CDR_CS_Num_Last_14_Days.csv")  
nameFile.append("_3G_Availability_Avg_Last_3_Days.csv")
nameFile.append("_2G_Availability_Avg_Last_3_Days.csv")
print('download CDR data')
for x01 in  range(len(nameFile)):
    urllib.request.urlretrieve(headerPath + dateUseType1 + "/" +  dateUseType1 + nameFile[x01], "worstcell dcr/rawData/" + dateUseType1 + nameFile[x01])
    print("data download " + dateUseType1 + nameFile[x01] )
    # outpul would be like http://osspm.indosatooredoo.com:8080/proptima/scheduled_reports/Putut_Purnama/RAW_DATA_DB_DAILY/20200120/20200120_KALSPP_REGIONAL_Level_Dashboard_Raw.csv


#--- CSSR
nameFile = []
nameFile.append("_3G_CSSR_CS_Failure_Last_14_Days.csv")
nameFile.append("_2G_CSSR_CS_Failure_Last_14_Days.csv")
nameFile.append("_3G_Availability_Avg_Last_3_Days.csv")
nameFile.append("_2G_Availability_Avg_Last_3_Days.csv")
print('download CSSR data')
for x01 in  range(len(nameFile)):
    urllib.request.urlretrieve(headerPath + dateUseType1 + "/" +  dateUseType1 + nameFile[x01], "worstcell cssr/rawData/" + dateUseType1 + nameFile[x01])
    print("data download " + dateUseType1 + nameFile[x01] )
    # outpul would be like http://osspm.indosatooredoo.com:8080/proptima/scheduled_reports/Putut_Purnama/RAW_DATA_DB_DAILY/20200120/20200120_KALSPP_REGIONAL_Level_Dashboard_Raw.csv

#============= MAIN PY WHERE PY OPEN MACRO EXCEL AND RUN MACRO ON IT
import win32com.client as wincl

print('Process CDR data')

excel_macro = wincl.DispatchEx("Excel.application")
excel_path = os.path.expanduser(os.path.join( os.getcwd(), "worstcell dcr/Worse Site 2G CDR CS.xlsm"))
workbook = excel_macro.Workbooks.Open(Filename = excel_path, ReadOnly =1)
excel_macro.Application.Run("jelek01.updateData")
excel_macro.Application.Run("jelek01.saveAsXlsx")
excel_macro.Application.Quit()  
del excel_macro

excel_macro = wincl.DispatchEx("Excel.application")
excel_path = os.path.expanduser(os.path.join( os.getcwd(),"worstcell dcr/Worse Site 3G CDR CS.xlsm"))
workbook = excel_macro.Workbooks.Open(Filename = excel_path, ReadOnly =1)
excel_macro.Application.Run("jelek01.updateData")
excel_macro.Application.Run("jelek01.saveAsXlsx")
excel_macro.Application.Quit()  
del excel_macro
    
print('Process CSSR data')    
excel_macro = wincl.DispatchEx("Excel.application")
excel_path = os.path.expanduser(os.path.join( os.getcwd(),"worstcell cssr/Worse Site 2G CSSR CS.xlsm"))
workbook = excel_macro.Workbooks.Open(Filename = excel_path, ReadOnly =1)
excel_macro.Application.Run("jelek01.updateData")
excel_macro.Application.Run("jelek01.saveAsXlsx")
excel_macro.Application.Quit()  
del excel_macro

excel_macro = wincl.DispatchEx("Excel.application")
excel_path = os.path.expanduser(os.path.join( os.getcwd(),"worstcell cssr/Worse Site 3G CSSR CS.xlsm"))
workbook = excel_macro.Workbooks.Open(Filename = excel_path, ReadOnly =1)
excel_macro.Application.Run("jelek01.updateData")
excel_macro.Application.Run("jelek01.saveAsXlsx")
excel_macro.Application.Quit()  
del excel_macro
    
#============= MAIN PY WHERE PY OPEN EXCEL FILE OUTPUT RESULT MACRO TO SEE MANUALY IF THERE ARE SOMTHING NOT RIGHT

os.system('start "excel" "worstcell dcr/Worse Site 2G CDR CS ' + dateUseType2 + '.xlsx"')
os.system('start "excel" "worstcell dcr/Worse Site 3G CDR CS ' + dateUseType2 + '.xlsx"')
os.system('start "excel" "worstcell cssr/Worse Site 2G CSSR CS ' + dateUseType2 + '.xlsx"')
os.system('start "excel" "worstcell cssr/Worse Site 3G CSSR CS ' + dateUseType2 + '.xlsx"')
    
input("if you see this message... download is success")