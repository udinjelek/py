import os
import time
from PIL import Image, ImageGrab
import keyboard
from playsound import playsound


# creating an image object
basenameFilePicture = input("name Picture Output: ")
print("Press Q for Quit")
print("Press W for Capture PrintScreen")
noPic = 0

print("000{}".format(noPic)[-4:])
while True:
	time.sleep(0.05)
	if keyboard.is_pressed("q"):
		print("q pressed, ending loop")
		break
	if keyboard.is_pressed("w"):
		noPic = noPic + 1
		picOut = ImageGrab.grab(bbox =(14, 100, 1832 , 1063 ))
		picOut.save("output/" + basenameFilePicture + "000{}".format(noPic)[-4:] + ".jpg")
		playsound('C:\Windows\media\Windows Hardware Insert.wav')
		print(basenameFilePicture +str(noPic) + " generate")
	if keyboard.is_pressed("e"):
		noPic = noPic + 0
		picOut = ImageGrab.grab(bbox =(14, 100, 1832 , 1063 ))
		picOut.save("output/" + basenameFilePicture + "000{}".format(noPic)[-4:] + ".jpg")
		playsound('C:\Windows\media\Windows Hardware Insert.wav')
		print(basenameFilePicture +str(noPic) + " generate")