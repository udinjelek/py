import os
import sys
xFind = "pfkafin"
xReplace = "pfardian"
for dname, dirs, files in os.walk("D:\\tmp\\y"):
	for fname in files:
		fpath = os.path.join(dname,fname)
		with open(fpath) as f:
			for line in f:
				if xFind in line:
					print(fpath)
					break
print("done")
			