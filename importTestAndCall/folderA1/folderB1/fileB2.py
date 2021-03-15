import sys, os
sys.path.append(os.path.dirname(os.getcwd()))
print(os.path.dirname(os.getcwd()))
import fileA1

print("B2")

sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
print(os.path.join(os.path.dirname(os.path.dirname(os.getcwd())),"folderA2"))

sys.path.append(os.path.join(os.path.dirname(os.path.dirname(os.getcwd())),"folderA2"))
import fileA2