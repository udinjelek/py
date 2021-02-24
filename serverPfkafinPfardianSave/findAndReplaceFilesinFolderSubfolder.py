import os
import io
import sys
xFind = "pfkafin"
xReplace = "pfardian"
for dname, dirs, files in os.walk("D:\\tmp\\zz"):
	for fname in files:
		fpath = os.path.join(dname,fname)
		with io.open(fpath,'r',encoding="ascii",errors='ignore') as f:
			s = f.read()
		s = s.replace(xFind, xReplace)
		with io.open(fpath, "wb") as f:
			f.write(s)
print("done")
			