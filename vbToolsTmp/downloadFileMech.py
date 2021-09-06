import urllib.request
import os
import sys
xx = sys.path
print ('\n'.join(xx))

# Download the file from `url` and save it locally under `file_name`:
print("hello:",os.getcwd())
urllib.request.urlretrieve('https://islamdownload.net/r/124170/MisyariRasyid-QuranTerjemah-001-Al-Fatihah.mp3', os.path.join(os.getcwd(),'001-MisyariRasyid-QuranTerjemah-Al-Fatihah.mp3'))