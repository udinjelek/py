import pyautogui
import time
from playsound import playsound

from pyautogui import *
import keyboard
import random
import win32api, win32con
print("Press Q for Quit")
while True:
    # do something
    time.sleep(0.5)
    pyautogui.click(950, 820)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

    time.sleep(0.5)
    pyautogui.click(1100, 820)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

playsound('C:\Windows\media\Alarm03.wav')