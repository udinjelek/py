from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys

url = "http://www.google.com/"

options = Options()
options.add_experimental_option("debuggerAddress","localhost:9250")
driver = webdriver.Chrome(options=options)
driver.get(url)

driver.find_element_by_name('q').send_keys('python tutorial')
driver.find_element_by_name('q').send_keys(Keys.ENTER)


