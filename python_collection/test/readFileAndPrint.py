fileIn = open('myfile.txt', 'r')
Lines = fileIn.readlines()
 
count = 0
# Strips the newline character
for line in Lines:
    count += 1
    print(line,end='')