#!/usr/bin/env python
import subprocess as sub
import BaseHTTPServer
import SimpleHTTPServer as httpd

# override this method to speed up connection
def _bare_address_string(self):
    host, port = self.client_address[:2]
    return '%s' % host
BaseHTTPServer.BaseHTTPRequestHandler.address_string = _bare_address_string

# get ip address and print
info = sub.Popen('/sbin/ifconfig', stdout=sub.PIPE).communicate()[0]
tokens = []
for line in info.split('\n'):
    if 'inet' in line:
        if '127.0.0.1' not in line:
            tokens = line.split()
print ("")
print ("'    ', tokens[1].replace(':', ': '), '\n    ',")


# start server
try:
    httpd.test()
except KeyboardInterrupt:
    print ('\x08\x08Killed')
