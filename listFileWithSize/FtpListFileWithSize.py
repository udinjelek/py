import os

import sys
dir_name = 'ftp://192.168.0.2:2221/'

from ftplib import FTP
  
ftp = FTP()
ftp.connect( '192.168.0.4', 2221)
ftp.login()
  
# changing directory
ftp.cwd('DCIM')
ftp.cwd('Camera')
#ftp.cwd('Screenshots')

listFiles = ftp.nlst()
ftp.sendcmd("TYPE i")    # Switch to Binary mode

fileLog= open('outputFTP.csv', "w")
fileLog.write("filename,size\n")
for file in listFiles:
    print(file, ftp.size(file))
    fileLog.write(",".join([file , str(ftp.size(file))]) )
    fileLog.write("\n")

fileLog.close()
# ftp.retrlines('LIST')
ftp.sendcmd("TYPE A")   
ftp.quit()


	
