import os
xFind = "pfkafin"
xReplace = "pfardian"
for dname, dirs, files in os.walk("D:\\Py\\ResultTest"):
	for fname in files:
		fpath = os.path.join(dname,fname)
		with open(fpath) as f:
			s = f.read()
		s = s.replace(xFind, xReplace)
		with open(fpath, "w") as f:
			f.write(s)
			