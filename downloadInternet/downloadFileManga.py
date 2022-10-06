import urllib.request
import os
import sys
xx = sys.path
print ('\n'.join(xx))

# Download the file from `url` and save it locally under `file_name`:
print("hello:",os.getcwd())

listPath = []
listPath.append("https://s7.mkklcdnv6tempv3.com/mangakakalot/o2/ou_dorobou_jing/vol1_chapter_1_1st_shot_in_the_city_of_thieves/")
listPath.append("https://s7.mkklcdnv6tempv3.com/mangakakalot/o2/ou_dorobou_jing/vol1_chapter_1_1st_shot_in_the_city_of_thieves/")


# urllib.request.urlretrieve('https://islamdownload.net/r/124170/MisyariRasyid-QuranTerjemah-001-Al-Fatihah.mp3', os.path.join(os.getcwd(),'001-MisyariRasyid-QuranTerjemah-Al-Fatihah.mp3'))



# import requests

# def exists(path):
    # r = requests.head(path)
    # return r.status_code == requests.codes.ok

# print (exists("https://s7.mkklcdnv6tempv3.com/mangakakalot/o2/ou_dorobou_jing/vol1_chapter_1_1st_shot_in_the_city_of_thieves/1.jpg"))


import requests
import shutil

r = requests.get('https://s7.mkklcdnv6tempv3.com/mangakakalot/o2/ou_dorobou_jing/vol1_chapter_1_1st_shot_in_the_city_of_thieves/1.jpg',  stream=True, headers={'User-agent': 'Mozilla/5.0'})
if r.status_code == 200:
    with open("img.png", 'wb') as f:
        print("open")
        r.raw.decode_content = True
        shutil.copyfileobj(r.raw, f)
else:
    print("code",r.status_code)    
    with open("img.jpg", 'wb') as f:
        print("open")
        r.raw.decode_content = True
        shutil.copyfileobj(r.raw, f)