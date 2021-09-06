import pyautogui
import time
import keyboard
from playsound import playsound


idlePoint = 0
while keyboard.is_pressed('q') == False:
    # player In Battle
    idlePoint = idlePoint + 1
    loc = pyautogui.locateOnScreen("imageReff/textDuelLog.PNG",region = (1240,20,1800-1240,240-20))
    if (loc is not None ):
        print("textDuelLog")
        idlePoint = 0
        loc = pyautogui.locateOnScreen("imageReff/buttonOk.PNG",region = (500,400,1400-500,1000-400)) 
        if(loc is not None ):
            print("buttonOk11")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
    
    # player Not In Battle
    loc = pyautogui.locateOnScreen("imageReff/buttonOk.PNG",region =(500,400,1400-500,1000-400)) 
    if(loc is not None ):
            print("buttonOk12")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')

    loc = pyautogui.locateOnScreen("imageReff/buttonOk2.PNG",region =(500,400,1400-500,1000-400)) 
    if(loc is not None ):
            print("buttonOk22")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')

    loc = pyautogui.locateOnScreen("imageReff/buttonNext.PNG",region = (500,400,1400-500,1000-400)) 
    if(loc is not None ):
            print("buttonNext1")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
    
    loc = pyautogui.locateOnScreen("imageReff/buttonNext2.PNG",region = (500,400,1400-500,1000-400)) 
    if(loc is not None ):
            print("buttonNext2")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
    
    loc = pyautogui.locateOnScreen("imageReff/buttonSpawn.PNG",grayscale = True, confidence=.8) 
    if(loc is not None ):
        
        print("buttonSpawn",loc)
        # loc = pyautogui.locateOnScreen("imageReff/buttonPlus.PNG",grayscale = True, confidence=.8) 
        # if(loc is not None ):
            # print("buttonPlus")
        loc = pyautogui.locateOnScreen("imageReff/buttonAssist.PNG",grayscale = True, confidence=.8) 
        if(loc is not None ):
            print("buttonAssist")
            idlePoint = 0
            pyautogui.click(x= loc[0],y=loc[1],clicks=1, interval=0, button='left')
    
    pyautogui.click(x= 650,y=660,clicks=1, interval=0, button='left')
    print("nothing")
    time.sleep(0.2)
    if idlePoint > 60 :
        playsound('C:\Windows\Media\Alarm01.wav')
        playsound('C:\Windows\Media\Alarm01.wav')
        playsound('C:\Windows\Media\Alarm01.wav')
        playsound('C:\Windows\Media\Alarm01.wav')
        playsound('C:\Windows\Media\Alarm01.wav')
