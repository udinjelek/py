
from PIL import Image, ImageTk

import os
from tkinter import  *
from tkinter import filedialog
# # # import tkFileDialog



class Jendela(Frame):
	def __init__(self,master = None):
		Frame.__init__(self,master)
		self.master = master
		self.inisiasiJendela()
		
	def inisiasiJendela(self):
		self.master.title("Jelek App")
		self.pack(fill=BOTH,expand=1)
		
		browseButton = Button(self,text='Browse Files', command = self.browseFileAction)
		# browseButton.place(x=50,y=100,height =30, width=120)
		
		listBox = Listbox(self,  height=15, width = 80)
		
		self.img = ImageTk.PhotoImage(PIL.self.Image.open("picJelek.png")) 
		self.canvas.create_image(20,20, anchor=NW, image=self.img)    
		self.canvas.image = self.img
		
		# label can be test or images
		
		
		listBox.grid     (row = 1, column = 2, columnspan = 4 , padx = 20, pady = 20)
		browseButton.grid(row = 2, column = 5, pady = 5)
		
	
		
	def browseFileAction(self):
		file = filedialog.askopenfilenames()
		if file != None:	
			for i in range(0,len(file)):
				print(file[i])





root = Tk()
root.geometry('530x750')
root.title("jelek app aaa")

# app = Jendela(root)
root.mainloop()