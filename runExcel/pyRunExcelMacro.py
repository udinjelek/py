import os, os.path
import win32com.client

if os.path.exists("masterMacro.xlsm"):
    xl=win32com.client.Dispatch("Excel.Application")
    xl.Workbooks.Open(os.path.abspath("masterMacro.xlsm"), ReadOnly=1)
    xl.Application.Run("masterMacro.xlsm!Module01.CopyPasteDataFromCsv")
##    xl.Application.Save() # if you want to save then uncomment this line and change delete the ", ReadOnly=1" part from the open function.
    xl.Application.Quit() # Comment this out if your excel script closes
    del xl