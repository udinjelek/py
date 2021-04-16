import os 
import pandas as pd

def printComparationFile(folderDetact,mode='normal'):
    os.chdir(folderDetact)
    listPathAll = sorted(filter(os.path.isfile, os.listdir('.')), reverse=True)

    listPath = []
    dateObjArr = []
    dateNow = ""
    maxCountDate = 4
    if (mode!='normal'):
        maxCountDate = maxCountDate * 2

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

            if (dateCounter >= maxCountDate):
                break
            dateCounter = dateCounter + 1
            dateNow = dateDetact
            
            if (mode=='normal'):
                dateObjArr.append(dateDetact)
            if (mode=='odd' and (dateCounter %2) == 1):
                dateObjArr.append(dateDetact)
            if (mode=='even' and (dateCounter %2) == 0):
                dateObjArr.append(dateDetact)
            
        listPath.append(name)
        if (mode=='normal'):
            sListName.append(nameDetact)
            sListDate.append(dateDetact)
            sListSize.append(sizeDetact)
        if (mode=='odd' and (dateCounter %2) == 1):
            sListName.append(nameDetact)
            sListDate.append(dateDetact)
            sListSize.append(sizeDetact)
        if (mode=='even' and (dateCounter %2) == 0):
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
    
    table['|']="|"
    table['Old2-Old3']=table[dateObjArr[2]]-table[dateObjArr[3]]
    table['Old1-Old2']=table[dateObjArr[1]]-table[dateObjArr[2]]
    table['New0-Old1']=table[dateObjArr[0]]-table[dateObjArr[1]]
    print (table)
    # print(dateObjArr)


print("=========================================================== PERCAUSE ========================")
folderDetact = r'C:\Eri\report\percause\rawData'
printComparationFile(folderDetact)
print("=============================================================================================")
print(" ")
print(" ")
print("=========================================================== HIGH UTIL =======================")
folderDetact = r'C:\Eri\report\high utilization\rawData'
printComparationFile(folderDetact)
print("=============================================================================================")
print(" ")
print(" ")
print("=========================================================== WCL Need Improve 1 ===============")
folderDetact = r'C:\Eri\report\wcl need improve\rawData'
printComparationFile(folderDetact,'odd')
print("=============================================================================================")
print(" ")
print(" ")
print("=========================================================== WCL Need Improve 2 ==============")
folderDetact = r'C:\Eri\report\wcl need improve\rawData'
printComparationFile(folderDetact,'even')
print("=============================================================================================")