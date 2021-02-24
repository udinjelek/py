import clipboard
from playsound import playsound

findString = '\r\n'
replaceString = "|"
pasteTextIn = clipboard.paste()
pasteTextOut = pasteTextIn.replace(findString, replaceString)

if pasteTextOut[-1:] == "|" :
    pasteTextOut = pasteTextOut[:-1]
print("In" , pasteTextIn)
print("Total Enter :", pasteTextIn.count(findString))
print("Out", pasteTextOut)

clipboard.copy(pasteTextOut)
playsound('C:\Windows\media\Alarm03.wav')
input("Press AnyKey to Exit")