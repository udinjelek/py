import os
dir_name = 'F:\\Sayumi\\'
# Get list of all files only in the given directory
list_of_files = filter( lambda x: os.path.isfile(os.path.join(dir_name, x)),os.listdir(dir_name) )
# Create a list of files in directory along with the size
files_with_size = [ (file_name, os.stat(os.path.join(dir_name, file_name)).st_size) for file_name in list_of_files  ]
# Iterate over list of files along with size 
# and print them one by one.


fileLog= open('outputFDS.csv', "w")	
fileLog.write("filename,size\n")

for file_name, size in files_with_size:
    print(file_name, ' --> ', size) 
    fileLog.write(",".join([file_name , str(size)]) )
    fileLog.write("\n")

fileLog.close()