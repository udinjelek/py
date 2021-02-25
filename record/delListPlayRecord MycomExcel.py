import pyautogui
import time
from playsound import playsound

from pyautogui import *
import keyboard
import random
import win32api, win32con

#pyautogui.click(48, 262) #New WO
#time.sleep(5)
#pyautogui.click(388, 143) #Applay Template
#time.sleep(4) 
playsound('C:\Windows\media\Alarm03.wav')
time.sleep(10) 
while keyboard.is_pressed('q') == False:
    for i in range(0,121):
        pyautogui.hotkey('alt', 'tab')
        time.sleep(1)
        pyautogui.press('down')
        time.sleep(0.1)
        pyautogui.hotkey('ctrl', 'c')
        time.sleep(0.5)
        pyautogui.hotkey('alt', 'tab')
        time.sleep(1)
        pyautogui.click(1091, 425)
        time.sleep(0.1)
        pyautogui.hotkey('ctrl', 'a')
        time.sleep(0.1)
        pyautogui.hotkey('ctrl', 'v')
        time.sleep(0.1)
        pyautogui.press('backspace')
        time.sleep(1)
        pyautogui.click(946, 575)
        time.sleep(0.1)
        
        

    playsound('C:\Windows\media\Alarm03.wav')
    playsound('C:\Windows\media\Alarm03.wav')
    playsound('C:\Windows\media\Alarm03.wav')
    break