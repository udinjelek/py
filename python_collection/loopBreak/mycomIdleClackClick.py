import pyautogui
import time
from playsound import playsound

from pyautogui import *
import keyboard
import random
import win32api, win32con

while True:
    # do something
    time.sleep(5)
    pyautogui.click(500, 500)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

    time.sleep(5)
    pyautogui.click(500, 600)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

    time.sleep(5)
    pyautogui.click(600, 600)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

    time.sleep(5)
    pyautogui.click(600, 500)
    if keyboard.is_pressed("q"):
        print("q pressed, ending loop")
        break

playsound('C:\Windows\media\Alarm03.wav')