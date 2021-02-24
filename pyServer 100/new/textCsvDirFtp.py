import csv
import pyodbc 
import io
import os
import sys 
from datetime import datetime, timedelta
from ftplib import FTP

fileInFtp=[]

ftpOut = FTP("10.22.254.99")
ftpOut.login(user="sss", passwd = "sss")
ftpOut.cwd("/")
ftpOut.retrlines('MLSD', fileInFtp.append)
for entry in fileInFtp:
	if(entry.lower().find("pmresult") != -1):
		print (entry.split(";"))