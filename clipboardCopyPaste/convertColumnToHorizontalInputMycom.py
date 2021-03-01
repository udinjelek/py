import clipboard
from playsound import playsound

findString1 = '\r\n'
findString2 = '\n'
replaceString = "|"
pasteTextIn = clipboard.paste()
pasteTextOut = pasteTextIn.replace(findString1, replaceString)
pasteTextOut = pasteTextOut.replace(findString2, replaceString)

if pasteTextOut[-1:] == "|" :
    pasteTextOut = pasteTextOut[:-1]

comma = ","

uniqueLen = len(list(set(pasteTextOut.replace(replaceString, comma).split(comma))))


print("In" , pasteTextIn)
print("Total Enter Mode 01:", pasteTextIn.count(findString1))
print("Total Enter Mode 02:", pasteTextIn.count(findString2))
print("Total Unique Data  :", uniqueLen)

print("")
print("Output :")
print(pasteTextOut)

clipboard.copy(pasteTextOut)
playsound('C:\Windows\media\Alarm03.wav')
input("Press AnyKey to Exit")