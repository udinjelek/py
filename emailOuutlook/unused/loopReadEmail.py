import threading as th
import time

keep_going = True
def key_capture_thread():
    global keep_going
    input()
    keep_going = False

def do_stuff():
    th.Thread(target=key_capture_thread, args=(), name='key_capture_thread', daemon=True).start()
    n = 1
    while keep_going:
        print('still going...' + str(n))
        n = n+1
        if n >10 : n = 0
        time.sleep(1)

do_stuff()


