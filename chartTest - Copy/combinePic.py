import sys
import math
from PIL import Image

def round_up(n, decimals=0): 
    multiplier = 10 ** decimals 
    return math.ceil(n * multiplier) / multiplier

	
outputName = 'RFC-20200302-00000013.png'

listImage = []

# listImage.append('xSCR-huawei-Kalimantan Pool.png') 		
# listImage.append('xASR-huawei-Kalimantan Pool.png')
listImage.append('xSCR-huawei-Northern West Pool.png')
listImage.append('xASR-huawei-Northern West Pool.png')
# listImage.append('xSCR-huawei-Southern West Pool.png')
# listImage.append('xASR-huawei-Southern West Pool.png')
# listImage.append('xSCR-huawei-Sulampapua Pool.png')
# listImage.append('xASR-huawei-Sulampapua Pool.png')
# listImage.append('xSCR-eri-Balomsum Pool.png')
# listImage.append('xASR-eri-Balomsum Pool.png')
# listImage.append('xSCR-eri-Central Java Pool.png')
# listImage.append('xASR-eri-Central Java Pool.png')
# listImage.append('xSCR-eri-East Java Pool.png')
# listImage.append('xASR-eri-East Java Pool.png')
# listImage.append('xSCR-eri-Jabo Pool.png')
# listImage.append('xASR-eri-Jabo Pool.png')

# listImage.append('xASR-eri-New CMN.png')
# listImage.append('xASR-eri-Transit.png')

# listMsc = ['MSMD8']
# for mscNow in listMsc:
# 	listImage.append('xASR-'+ mscNow+'.png')
# 	listImage.append('xSCR-'+ mscNow+'.png')

print(listImage)
images = [Image.open(x) for x in listImage 	]

widthUse = 800
heightUse = 400
newImage = Image.new('RGB', (int(widthUse * 2)  , int(heightUse * round_up(len(images)/2) ) ), (255, 255, 255) )


for noImg in range(0,len(images)):
	if noImg % 2 == 0:
		posX = 0
	else:
		posX = widthUse
	posY = int((noImg)/2) * heightUse
	newImage.paste(images[noImg], (posX,posY))
newImage.save(outputName)

