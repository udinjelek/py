#3.0 map function

oldListData = [1,2,3,4,5,100,300,500,700,900]

def funcAdd1000(x):
    return (x+1000)
   
print ("oldListData :",oldListData)    

newListData = []

for noList in oldListData:
    newListData.append(funcAdd1000(noList))

# loop sample, basic methode
print("newListData01:" , newListData)
# map sample
print("newListData02:" , list(map(funcAdd1000,oldListData)))
# loop inline sample,
print("newListData03:" , [funcAdd1000(z) for z in oldListData])

print("newListData04:" , [funcAdd1000(z) for z in oldListData if (z%2) == 0])

#------------------
# sand box arena
#------------------

def funcAddXY(x,y):
    return (x+y)
print("")
print("newListDataX0:" ,oldListData)
print("newListDataX1:" ,list(map(funcAddXY,oldListData,oldListData)))
print("newListDataY0:" ,list(map(funcAdd1000,oldListData)))
print("newListDataY0:" ,list(map(funcAddXY,oldListData,list(map(funcAdd1000,oldListData)))))