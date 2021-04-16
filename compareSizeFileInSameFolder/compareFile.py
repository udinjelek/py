import os 
import pandas as pd

def printComparationFile(folderDetact):
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
        sizeDetact =  round(os.path.getsize(fullPath) / 1024 ) # size in bytes / 1000 -> Kbytes -> remove decimal From 127.4598 -> 127
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

    # print(sListDate)
    # print(sListName)
    # print(sListSize)

        
    sObj = {'Name': sListName,
            'Date': sListDate,
            'Size': sListSize
            }

    df = pd.DataFrame(sObj, columns = ['Name', 'Date', 'Size'])
    # print (df)

    table=pd.pivot_table(df,index='Name',columns='Date',values='Size',aggfunc='mean')
    
    table['diff Old-Old2']=table[dateObjArr[1]]-table[dateObjArr[2]]
    table['diff New-Old']=table[dateObjArr[0]]-table[dateObjArr[1]]
    print (table)

folderDetact = r'C:\Eri\report\percause\rawData'
print("=========================================================== PERCAUSE ========================")
printComparationFile(folderDetact)
print("=============================================================================================")
print(" ")
print(" ")
print(" ")
folderDetact = r'C:\Eri\report\high utilization\rawData'
print("=========================================================== HIGH UTIL =======================")
printComparationFile(folderDetact)
print("=============================================================================================")

# folderDetact = r'C:\Eri\report\wcl need improve\rawData'
# printComparationFile(folderDetact)