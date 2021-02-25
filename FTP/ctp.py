import paramiko

source = r'C:\Eri\vba\mycom file.txt'
dest = r'/file.txt'
hostname = '192.168.0.102'
port = 22 # default port for SSH
username = ''
password = ''

try:
    t = paramiko.Transport((hostname, port))
    t.connect(username=username, password=password)
    sftp = paramiko.SFTPClient.from_transport(t)
    sftp.put(source, dest)
finally:
    t.close()