# # # Write into File
# # # ---
text_file = open("Output.txt", "w")
text_file.write("Purchase Amount: %s" % TotalAmount)
text_file.close()

with open("Output.txt", "w") as text_file:
    text_file.write("Purchase Amount: %s" % TotalAmount)
    

# # # Read Only (‘r’) : Open text file for reading. The handle is positioned at the beginning of the file. If the file does not exists, raises I/O error. This is also the default mode in which file is opened.
# # # Read and Write (‘r+’) : Open the file for reading and writing. The handle is positioned at the beginning of the file. Raises I/O error if the file does not exists.
# # # Write Only (‘w’) : Open the file for writing. For existing file, the data is truncated and over-written. The handle is positioned at the beginning of the file. Creates the file if the file does not exists.
# # # Write and Read (‘w+’) : Open the file for reading and writing. For existing file, data is truncated and over-written. The handle is positioned at the beginning of the file.
# # # Append Only (‘a’) : Open the file for writing. The file is created if it does not exist. The handle is positioned at the end of the file. The data being written will be inserted at the end, after the existing data.
# # # Append and Read (‘a+’) : Open the file for reading and writing. The file is created if it does not exist. The handle is positioned at the end of the file. The data being written will be inserted at the end, after the existing data.


# # # Read Each Lines from File
fileIn = open('myfile.txt', 'r')
Lines = fileIn.readlines()
 
count = 0
for line in Lines:
    count += 1
    print(line,end='')
    
    
# # # Split String
textIn = "monster,in my heart"
textOut = textIn.split(",")

# # # Split String in CSV
import csv
with open('myfile.txt', newline='') as myFile:
    reader = csv.reader(myFile, delimiter=',', quoting=csv.QUOTE_NONE)
    for row in reader:
        print(row)