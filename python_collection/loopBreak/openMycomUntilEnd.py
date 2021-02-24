import pyautogui
import time
from playsound import playsound

from pyautogui import *
import keyboard
import random
import win32api, win32con
import os

from python_imagesearch.imagesearch import imagesearch

stateProgram = "OpenProgram"
stateLoop = True
timeCounter = 0
timeFail = 0
while stateLoop == True:
    # do something
    time.sleep(1)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        stateProgram = False
        break
        
    if stateProgram == "OpenProgram":
        os.startfile(r"C:\Users\earginm\Downloads\Proptima.jnlp")
        stateProgram = "WaitProgramOpen"
        timeCounter = 0
    
    if stateProgram == "WaitProgramOpen":
        timeCounter = timeCounter + 1
        if timeCounter >= 60 * 15:
            stateLoop = False
            break
       
        pos = imagesearch("./stateMycomFull.PNG")
        if pos[0] != -1:
            #print("position : ", pos[0], pos[1])
            print("Failed :" , timeFail)
            
            timeFail = timeFail + 1
            timeCounter = 0
            pyautogui.press('enter')
            time.sleep(3)
            stateProgram = "OpenProgram"
        else:
            timeCounter = timeCounter + 1
        
        pos = imagesearch("./stateMycomSuccess.PNG")
        if pos[0] != -1:
            print("position : ", pos[0], pos[1])
            print("Success")
            stateLoop = False
            break
        else:
            timeCounter = timeCounter + 1

playsound('C:\Windows\media\Alarm03.wav')
playsound('C:\Windows\media\Alarm03.wav')
playsound('C:\Windows\media\Alarm03.wav')
playsound('C:\Windows\media\Alarm03.wav')
playsound('C:\Windows\media\Alarm03.wav')