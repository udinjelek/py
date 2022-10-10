import pyautogui
import time
import keyboard

while True:
	time.sleep(0.5)
	print(pyautogui.position())
	if keyboard.is_pressed("q"):
		print("q pressed, ending loop")
		break
