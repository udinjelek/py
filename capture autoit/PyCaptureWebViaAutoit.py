import os

import webbrowser as wb
import time



os.system("taskkill /im chrome.exe /f")
url='http://10.17.16.99/reports/HW_SUBSCRIBER_MSC.php'
pathBrowser="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
wb.register('chrome', None,wb.BackgroundBrowser(pathBrowser))
wb.get('chrome').open(url,new= 1)
time.sleep(7)
os.system("capture.au3")
os.system("taskkill /im chrome.exe /f")
