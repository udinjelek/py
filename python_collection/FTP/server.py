#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import socket
import os

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("", 12345)) #if the clients/server are on different network you shall bind to ('', port)

pathFile = r"C:\Users\earginm\Downloads\weathering with you.mp4"
pathFile = r"C:\Users\earginm\Downloads\4G Region Hourly 2020-10-30.csv"
pathFile = "4G Region Hourly 2020-10-30.csv"

s.listen(10)
c, addr = s.accept()
print('{} connected.'.format(addr))

f = open(pathFile, "rb")
l = os.path.getsize(pathFile)
m = f.read(l)
c.send_all(m)
f.close()
print("Done sending...")