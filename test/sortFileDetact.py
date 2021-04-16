import os 

folderDetact = r'C:\Eri\report\percause\rawData'
os.chdir(folderDetact)
listPathAll = sorted(filter(os.path.isfile, os.listdir('.')), reverse=True)

listPath = []
dateObjArr = []
dateNow = ""

sListDate = [] #source List Date File
sListName = [] #source List Name File
sListSize = [] #source List Size File

dateCounter = 0
for name in listPathAll:
    dateDetact = name[0:8]           # from '20201014_Cek_Twamp_3G_SRAT.csv' -> '20201014'
    nameDetact = name[9:-4]          # from '20201014_Cek_Twamp_3G_SRAT.csv' -> 'Cek_Twamp_3G_SRAT'
    fullPath = os.path.join(folderDetact, name)  #  combine folder +  '20201014_Cek_Twamp_3G_SRAT.csv'
    sizeDetact =  round(os.path.getsize(fullPath) / 1000 ) # size in bytes / 1000 -> Kbytes -> remove decimal From 127.4598 -> 127
    if (dateNow != dateDetact):

        if (dateCounter > 3):
            break
        dateObjArr.append(dateDetact)
        dateCounter = dateCounter + 1
        dateNow = dateDetact
    listPath.append(name)

    sListName.append(nameDetact)
    sListDate.append(dateDetact)
    sListSize.append(sizeDetact)

# print(listPath)
# print(dateObjArr)


print(sListDate)
print(sListName)
print(sListSize)

    
