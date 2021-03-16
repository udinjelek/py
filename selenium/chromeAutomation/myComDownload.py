import subprocess
proc = subprocess.Popen('cmd /k chrome.exe --remote-debugging-port=9250 --user-data-dir="C:\chromedriver"')
try:
    outs, errs = proc.communicate(timeout=5)
except: #TimeoutExpired
    proc.kill()
    outs, errs = proc.communicate()
import os

import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys

url = "http://osspm.indosatooredoo.com:8080/"

options = Options()

options.add_experimental_option("debuggerAddress","localhost:9250")
driver = webdriver.Chrome(options=options)
driver.get(url)


time.sleep(5)

driver.find_element_by_id('loginName').send_keys('M_Rizaq')
driver.find_element_by_id('password').send_keys('Ericsson12345678!')
driver.find_element_by_id('password').send_keys(Keys.ENTER)

if os.path.exists(r'C:\Users\earginm\Downloads\Proptima.jnlp'):
    os.remove(r'C:\Users\earginm\Downloads\Proptima.jnlp')

time.sleep(3)

driver.find_element_by_id('NIMS_PROPTIMA_Desktop-Client').click()

import pyautogui
from pyautogui import *
time.sleep(3)
pyautogui.hotkey('enter')

masterPath = (os.getcwd())
targetPath = (os.path.join(os.path.dirname(os.path.dirname(os.getcwd())),"loopBreak"))
os.chdir(targetPath)

time.sleep(3)


# import subprocess
# subprocess.call([os.path.join(targetPath,'callPy_openMycomUntilEnd.bat')])

exec(open(os.path.join(targetPath,'openMycomUntilEnd.py')).read())
