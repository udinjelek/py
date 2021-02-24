import os
from tkinter import  *
from tkinter import filedialog
from tkinter import messagebox
from PIL import ImageTk
from PIL import Image
import time
global selectionList




def browseFileAction():
	file = filedialog.askopenfilenames()
	if file != None:	
		for i in range(0,len(file)):
			listBox01.insert(0,file[i])
			print(file[i])

def listBoxPilih():
	selectionList = listBox01.curselection()
	if len(selectionList) >0:
		print ('---')
		print (selectionList)
	
def hapusListSelect():
	selectionList = listBox01.curselection()
	if len(selectionList) >0:
		listBox01.delete(selectionList[0])
		# selectionList[0] = -1

def hapusListAll():
	if listBox01.size() > 1:
		listBox01.delete(0,listBox01.size()-1)


def jelekAction():
	# textInput02.get()
	messagebox.showinfo("Info", 'Convert Finish\n\nOutput file will be rename with prefix "Output"')
	
root = Tk()
root.title("Harta Karun (n_n)/")
root.resizable(width=False, height=False)
# pixel = ImageTk.PhotoImage(width=1, height=1)

selectionList = 0 
xxx = 400
labelText=StringVar()
labelText.set("Convert Delimeted From")
labelDir=Label(root, textvariable=labelText)
labelDir.grid(row=12,column=0)

directory=StringVar(root, value = ';')
textInput01=Entry(root,textvariable=directory,width=3,justify='center')
textInput01.grid(row=12,column=1)

labelText=StringVar()
labelText.set("Into Delimeted")
labelDir=Label(root, textvariable=labelText)
labelDir.grid(row=13,column=0)

directory=StringVar(root, value = ',')
textInput02=Entry(root,textvariable=directory,width=3,justify='center')
textInput02.grid(row=13,column=1)

browseButton01 = Button(root, text='Add Browse Files', command = browseFileAction, height = 3)
browseButton01.grid(row = 12, column = 7, rowspan = 2)

jelekButton01 = Button(root, text='Convert Data', command = jelekAction, width = 70, height = 2)
jelekButton01.grid(row = 15, column = 0, rowspan = 2, columnspan = 8, pady = 10)

delBrowseButton01 = Button(root,text='Delete List All', command = hapusListAll , width = 20)
delBrowseButton01.grid(row = 12, column = 6)

delBrowseButton02 = Button(root,text='Delete List Selected', command = hapusListSelect , width = 20)
delBrowseButton02.grid(row = 13, column = 6)

listBox01 = Listbox(root, height=15, width = 80)
listBox01.bind('<<ListboxSelect>>', lambda event: listBoxPilih())
listBox01.grid     (row = 11, column = 0, columnspan = 8 , padx = 20, pady = 5)

hasilRender = ImageTk.PhotoImage(Image.open("picJelek02.png"))  
gambar = Label(root, image=hasilRender)
gambar.image = hasilRender
gambar.grid (row = 0, column = 0,columnspan = 8, rowspan = 10)

for timeAnime in range(-200 ,790,8):
	if timeAnime == -200:
		root.geometry('530x400')
		root.update()
	elif timeAnime > 400:
		root.geometry('530x' + str(timeAnime))
		root.update()
	time.sleep(.01)

  
root.mainloop()

