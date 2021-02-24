#Python 3.7 Latihan By jelek

# with open('log.txt', 'r+', encoding = 'utf-8') as f:
  
   # f.write('my 2nd edit\n')
   # # f.write('This file\n')
   # # f.write('contains three lines\n')
	# f.close

with open('app.log', 'w', encoding = 'utf-8') as f:
   #first line
   f.write('It is my first file\n')
   #second line
   f.write('This file\n')
   #third line
   f.write('contains three lines\n')

#Open a file
f = open('app.log', 'r+')
data = f.read(19);
print('Read String is : ', data)

#Check current position
position = f.tell();
print('Current file position : ', position)

#Reposition pointer at the beginning once again
position = f.seek(0, 0);
data = f.read(19);
print('Again read String is : ', data)

#Close the opened file
f.close()



###
infile = file('./oldfile.txt')

newopen = open('./newfile.txt', 'w')
for line in infile :

    if 'bad' in line:
        line = line.replace('.' , '')
    if 'naughty' in line:
        line = line.replace('.', '')
    else:
        newopen.write(line)

newopen.close()

###
bad_words = ['bad', 'naughty']

with open('oldfile.txt') as oldfile, open('newfile.txt', 'w') as newfile:
    for line in oldfile:
        if not any(bad_word in line for bad_word in bad_words):
            newfile.write(line)