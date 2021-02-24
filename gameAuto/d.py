import tkinter as tk # Python 3
from functions import window_coordinates


x, y, w, h = window_coordinates("3949206036")

def update_coordinates():
    global x, y, w, h
    x, y, w, h = window_coordinates("3949206036")
    root.geometry("+{}+{}".format(x + 100, y + 100))
    label.after(1, update_coordinates)           #  This addition was needed

root = tk.Tk()
# The image must be stored to Tk or it will be garbage collected.
root.image = tk.PhotoImage(file='picJelek.png')
label = tk.Label(root, image=root.image, bg='white')
root.overrideredirect(True)
root.geometry("+{}+{}".format(x+100, y+100))
root.lift()
root.wm_attributes("-topmost", True)
root.wm_attributes("-disabled", True)
root.wm_attributes("-transparentcolor", "white")
label.pack()

label.after(1, update_coordinates)
label.mainloop()