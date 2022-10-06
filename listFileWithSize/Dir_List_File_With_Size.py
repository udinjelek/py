import os
dir_name = 'E:\\foto camera 2022-02-02\\'

list_of_files = filter( lambda x: os.path.isfile(os.path.join(dir_name, x)),os.listdir(dir_name) )

files_with_size = [ (file_name, os.stat(os.path.join(dir_name, file_name)).st_size) for file_name in list_of_files  ]


fileLog= open('E:\\output\\outputFoto.csv', "w")	
fileLog.write("filename,size\n")

for file_name, size in files_with_size:
    print(file_name, ' --> ', size) 
    fileLog.write(",".join([file_name , str(size)]) )
    fileLog.write("\n")

fileLog.close()