df = 'ctp.py'
blocksize = 8192 # or some other size packet you want to transmit.  
                 # Powers of 2 are good.
conn = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

if os.path.exists(df):
  with open(df, 'rb') as f:
    packet = f.read(blocksize)

    while packet != '':
      conn.send(packet)

      packet = f.read(blocksize)