import tkinter as tkAku

rootAja = tkAku.Tk()
logoAja = tkAku.PhotoImage(file="python_logo_small.gif")

x01 = tkAku.Label(rootAja, image=logoAja).pack(side="right")

penjelasan = """pada saat ini hanya GIF dan PPM/PGM 
fromat yg di suport, tapi tampilan mengjinkan 
ntuk penambahan format lain dengan mudah"""
 
x02 = tkAku.Label(rootAja, justify=tkAku.CENTER, padx = 10, text=penjelasan).pack(side="left")
rootAja.mainloop()
 
