from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

server_address = ('0.0.0.0', 2221)    
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
os.chdir('C:/')  # optional
print('Running server...')
httpd.serve_forever()