from tkinter import *
from PIL import Image, ImageTk

class Window(Frame):
	#latihan No 01
	def __init__(self, master=None):
		Frame.__init__(self, master)               
		self.master = master
		self.init_window()
		
	def init_window(self):
		# changing the title of our master widget      
		self.master.title("Latihan GUI")
		# allowing the widget to take the full space of the root window
		self.pack(fill=BOTH,expand=1)
		
		
#====== creating a button instance 
		# Latihan No 02 ================================
		quitButton = Button(self,text="- Quit -",command=self.exitTombol)
		#place the button on my window
		quitButton.place(x=100,y=100)
		
#====== creating a menu instance
		# Latihan No 03 ================================
		menuJelek = Menu(self.master)
		self.master.config(menu=menuJelek)
		
		#creating the file object
		fileAbcde = Menu(menuJelek)
		#add a command to the menu option, calling it exitm and the command it run exit
		fileAbcde.add_command(label="Exit",command=self.exitTombol)
		#add "file" to our menu
		menuJelek.add_cascade(label="File ajah",menu=fileAbcde)
		
		#creating the file object
		editDefgh = Menu(menuJelek)
		#add a command to the menu option, calling it exit and bla bla bla
		editDefgh.add_command(label="Show Img",command=self.showGambar)
		editDefgh.add_command(label="Show Text",command=self.showTulisan)
		menuJelek.add_cascade(label="Edit ajah",menu=editDefgh)
#-------------------------------------------------------		
		
	# Latihan No 02	
	def exitTombol(self):
		exit()
		
	# Latihan No 03
	def showGambar(self):
		loadGambar = Image.open("logo.png")
		hasilRender = ImageTk.PhotoImage(loadGambar)
		# label can be test or images
		gambar = Label(self, image=hasilRender)
		gambar.image = hasilRender
		gambar.place(x=200,y=10)
		
		
	def showTulisan(self):
		tulisan = Label(self, text="hai hello world")
		tulisan.pack()

root = Tk()
#size window
root.geometry("700x400")

app = Window(root)

root.mainloop()