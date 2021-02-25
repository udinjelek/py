import pyautogui
import time
from playsound import playsound

pyautogui.click(48, 236) #New WO
time.sleep(5)
pyautogui.click(388, 143) #Applay Template
time.sleep(4) 
pyautogui.press('tab')
time.sleep(0.1)
pyautogui.press('tab')
time.sleep(0.1)
pyautogui.press('tab')
time.sleep(0.1)
pyautogui.press('tab')
time.sleep(0.1)
pyautogui.press('tab')
time.sleep(0.1)
pyautogui.press('enter')
time.sleep(3)
pyautogui.click(551, 463) #summary
pyautogui.hotkey('ctrl', 'v')
for i in range(1,15):
    pyautogui.scroll(-100)
    time.sleep(0.1)
    
pyautogui.click(262, 1043)
for i in range(1,15):
    pyautogui.scroll(-100)
    time.sleep(0.1)

pyautogui.click(501, 477) #attachment
time.sleep(3) 
pyautogui.click(338, 512) #add File
time.sleep(2)
pyautogui.press('tab')
time.sleep(1)
pyautogui.press('enter')
time.sleep(1)
pyautogui.write('RE ENM and OSS User Creation Optimization.msg')
time.sleep(1)
pyautogui.press('enter')
time.sleep(2)
pyautogui.press('tab')
time.sleep(1)
pyautogui.press('enter')
time.sleep(3)
pyautogui.click(314, 146) #save
time.sleep(9)
pyautogui.moveTo(232,229)
pyautogui.mouseDown(button='left')
pyautogui.moveTo(521,229,1)
pyautogui.mouseUp(button='left')
pyautogui.hotkey('ctrl', 'c')

for i in range(1,27):
    pyautogui.scroll(-100)
    time.sleep(0.1)

pyautogui.click(338, 512) #add File
time.sleep(2)
pyautogui.press('tab')
time.sleep(1)
pyautogui.press('enter')
time.sleep(1)
pyautogui.write('RE ENM and OSS User Creation Optimization.msg')
time.sleep(1)
pyautogui.press('enter')
time.sleep(2)
pyautogui.press('tab')
time.sleep(1)
pyautogui.press('enter')
time.sleep(1)
pyautogui.moveTo(420,145)

playsound('C:\Windows\media\Alarm03.wav')