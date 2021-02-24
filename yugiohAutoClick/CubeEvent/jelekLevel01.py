import pyautogui
import time
from playsound import playsound


idlePoint = 0
while True:
	# player In Battle
	idlePoint = idlePoint + 1
	loc = pyautogui.locateOnScreen("imageReff/textDuelLog.PNG",region = (1240,20,1800-1240,240-20))
	if (loc is not None ):
		idlePoint = 0
		loc = pyautogui.locateOnScreen("imageReff/buttonOk.PNG",region = (500,400,1400-500,1000-400)) 
		if(loc is not None ):
			idlePoint = 0
			pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
	
	# player Not In Battle
	loc = pyautogui.locateOnScreen("imageReff/buttonOk.PNG",region =(500,400,1400-500,1000-400)) 
	if(loc is not None ):
			idlePoint = 0
			pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')

	loc = pyautogui.locateOnScreen("imageReff/buttonOk2.PNG",region =(500,400,1400-500,1000-400)) 
	if(loc is not None ):
			idlePoint = 0
			pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')

	loc = pyautogui.locateOnScreen("imageReff/buttonNext.PNG",region = (500,400,1400-500,1000-400)) 
	if(loc is not None ):
			idlePoint = 0
			pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
	
	loc = pyautogui.locateOnScreen("imageReff/buttonNext2.PNG",region = (500,400,1400-500,1000-400)) 
	if(loc is not None ):
			idlePoint = 0
			pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
	
	loc = pyautogui.locateOnScreen("imageReff/buttonSpawn.PNG",region = (500,200,1400-500,1000-200)) 
	if(loc is not None ):
		print("A")
		loc = pyautogui.locateOnScreen("imageReff/buttonPlus.PNG",region = (500,200,1400-500,1000-200)) 
		if(loc is not None ):
			print("B")
			loc = pyautogui.locateOnScreen("imageReff/buttonAssist.PNG",region = (500,200,1400-500,1000-200)) 
			if(loc is not None ):
				print("C")
				idlePoint = 0
				pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
	
	pyautogui.click(x= 650,y=660,clicks=1, interval=0, button='left')
	time.sleep(0.2)
	if idlePoint > 60 :
		playsound('C:\Windows\Media\Alarm01.wav')
		playsound('C:\Windows\Media\Alarm01.wav')
		playsound('C:\Windows\Media\Alarm01.wav')
		playsound('C:\Windows\Media\Alarm01.wav')
		playsound('C:\Windows\Media\Alarm01.wav')
