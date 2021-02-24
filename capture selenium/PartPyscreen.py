import os
import pyscreenshot as ImageGrab
import webbrowser as wb
import time



os.system("taskkill /im chrome.exe /f")

url='http://10.17.16.99/reports/HW_SUBSCRIBER_MSC.php'
pathBrowser="C:\\Users\\jelek\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe" #pc jelek
pathBrowser="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe" #pc 100
wb.register('chrome', None,wb.BackgroundBrowser(pathBrowser))
# wb.get('chrome').args.append(FULLSCREEN_ARGUMENT)

wb.get('chrome').open(url,new= 1)


time.sleep(15)
if __name__ == '__main__':
	im = ImageGrab.grab(bbox=(5, 110, 1230, 810)) # X1,Y1,X2,Y2
	# im.save('screenshot.png')
	im.show()