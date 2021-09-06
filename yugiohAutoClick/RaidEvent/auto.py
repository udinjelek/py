from pyautogui import *
import pyautogui
import time
import keyboard
import random
import win32api, win32con

def click(x,y):
    win32api.SetCursorPos((x,y))
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTDOWN,0,0)
    time.sleep(0.01)
    win32api.mouse_event(win32con.MOUSEEVENTF_LEFTUP,0,0)

y_height = 600
y_height2 = 590 

y_hit = 610
   
while keyboard.is_pressed('q') == False:
    
    if pyautogui.pixel(833,y_height)[0] == 17 and pyautogui.pixel(833,y_height2)[0] == 17:
        click(833,y_hit)
    if pyautogui.pixel(940,y_height)[0] == 17 and pyautogui.pixel(940,y_height2)[0] == 17:
        click(940,y_hit)
    if pyautogui.pixel(1037,y_height)[0] == 17 and pyautogui.pixel(1037,y_height2)[0] == 17:
        click(1037,y_hit)
    if pyautogui.pixel(1142,y_height)[0] == 17 and pyautogui.pixel(1142,y_height2)[0] == 17:
        click(1142,y_hit)
		
		