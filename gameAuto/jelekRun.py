import pyautogui 
import msvcrt
from time import sleep
# print(pyautogui.position())
# print(pyautogui.locateCenterOnScreen('picCollection\\01_dbvisicon.PNG'))

# pyautogui.doubleClick(pyautogui.locateCenterOnScreen('picCollection\\01_dbvisicon.PNG'))
# pyautogui.locateCenterOnScreen('picCollection\\x01_closeAdsOpeningGame.PNG')
# print(pyautogui.locateCenterOnScreen('picCollection\\x01_closeButton.PNG'))

def checkPic(urlPic):
	
	try:
		result =  pyautogui.locateCenterOnScreen('picCollection\\' + urlPic,region=(0,0,750,450))
		
	except TypeError:
		result = "ErrorNotFound"
	# pyautogui.click()
	
	return result

resultx = checkPic('x01_closeAdsOpeningGame.PNG')
if resultx != "ErrorNotFound":
	print('---')
	print(resultx)



statusGame = 'unknown'
iii = 1
while(True):
	sleep(1)
	iii = iii + 1
	if iii > 9: iii = 0
	print("--- " + str(iii) + " ---")
	
	
	# code start here
	if statusGame == 'unknown':
		loopNow = True
		while(loopNow):
			loopNow = False
			# checkAds
			resultPic = checkPic('x01_closeAdsOpeningGame.PNG')
			if resultPic != "ErrorNotFound":
				loopNow = True
				pyautogui.click(x=resultPic.x,y=resultPic.y)
				sleep(1)
			resultPic = checkPic('x02_closeAdsOpeningGame.PNG')
			if resultPic != "ErrorNotFound":
				loopNow = True
				pyautogui.click(x=resultPic.x,y=resultPic.y)
				sleep(1)
			resultPic = checkPic('x01_closeButton.PNG')
			if resultPic != "ErrorNotFound":
				loopNow = True
				pyautogui.click(x=resultPic.x,y=resultPic.y)
				sleep(1)
			resultPic = checkPic('x02_closeButton.PNG')
			if resultPic != "ErrorNotFound":
				loopNow = True
				pyautogui.click(x=resultPic.x,y=resultPic.y)
				sleep(1)
				
			resultPic = checkPic('x03_closeButton.PNG')
			if resultPic != "ErrorNotFound":
				loopNow = True
				pyautogui.click(x=resultPic.x,y=resultPic.y)
				sleep(1)
				