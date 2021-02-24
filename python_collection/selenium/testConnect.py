# from selenium.webdriver import Firefox
# from selenium.webdriver.firefox.options import Options
# opts = Options()
# opts.set_headless()
# assert opts.headless  # Operating in headless mode
# browser = Firefox(options=opts)
# browser.get('https://duckduckgo.com')
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait as wait

import time



from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Firefox(executable_path=r'geckodriver.exe')
driver.get("http://ticket/sm/index.do")
search_form = driver.find_element_by_id('LoginUsername')
search_form.send_keys('eid-AdeTri')
search_form = driver.find_element_by_id('LoginPassword')
search_form.send_keys('123456')
search_form.submit()

element = wait(driver, 120).until(EC.element_to_be_clickable((By.XPATH, "//span[text()='WO']")))
driver.execute_script("arguments[0].click();", element)

time.sleep(6)
# print("1")
# element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ext-gen326")))
# driver.execute_script("arguments[0].click();", element)

# element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ext-gen10")))
# time.sleep(3)
# print("2")
element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ROOT/WO/New WO")))
driver.execute_script("arguments[0].click();", element)

element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ext-gen390")))
driver.execute_script("arguments[0].click();", element)
time.sleep(5)

driver.switch_to.frame(1)
element = wait(driver, 5).until(EC.presence_of_element_located((By.LINK_TEXT, 'aa draftTemplate2')))
driver.execute_script("arguments[0].click();", element)

# driver.find_element_by_link_text("aa draftTemplate2").click()
# driver.find_element_by_xpath("//a[contains(string(.),'aa draftTemplate2']").click()

# element = wait(driver, 5).until(EC.presence_of_element_located((By.LINK_TEXT, 'aa draftTemplate2')))
# driver.execute_script("arguments[0].click();", element)
# time.sleep(3)
# print("3")
# element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ext-gen325")))
# driver.execute_script("arguments[0].click();", element)
# element.click()


# time.sleep(3)
# print("4")
# element = wait(driver, 5).until(EC.presence_of_element_located((By.ID, "ext-gen351")))
# driver.execute_script("arguments[0].click();", element)
# driver.execute_script("arguments[0].click();", element)
# element.click()


# time.sleep(3)
# print("5")
# element = wait(driver, 5).until(EC.element_to_be_clickable((By.XPATH, "//span[text()='New WO']")))
# driver.execute_script("arguments[0].click();", element)
# driver.execute_script("arguments[0].click();", element)
# element.click()


# time.sleep(3)
# print("6")
