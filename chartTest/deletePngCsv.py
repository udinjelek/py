import os
filelist = [ f for f in os.listdir() if f.endswith(".png") ]
for f in filelist:
    os.remove(os.path.join('', f))

filelist = [ f for f in os.listdir() if f.endswith(".csv") ]
for f in filelist:
    os.remove(os.path.join('', f))