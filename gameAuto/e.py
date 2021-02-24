from tkinter import *
import time
gui = Tk()
var=IntVar()
gui.geometry("800x800")
c = Canvas(gui ,width=800 ,height=800)
c.pack()
oval = c.create_oval(5,5,60,60,fill='pink')
a = 5
b = 5
for x in range(0 ,500):
  c.move(oval,a,b)
  gui.geometry("800x" + str(800-x))
  gui.update()
  
  time.sleep(.01)
gui.title("First title")
gui.mainloop()