from http.server import HTTPServer, SimpleHTTPRequestHandler  

import os

server_a = ('0.0.0.0',8081)
httpd = HTTPServer (server_a, SimpleHTTPRequestHandler)
os.chdir('E:/')
print('server running..')
httpd.serve_forever()

