#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("100.120.65.162", 12345)) # here you must past the public external ipaddress of the server machine, not that local address

f = open("movie.mp4", "wb")
data = None
while True:
    m = s.recv(1024)
    data = m
    if m:
        while m:
            m = s.recv(1024)
            data += m
        else:
            break
f.write(data)
f.close()
print("Done receiving")