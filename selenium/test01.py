# # # # # from selenium import webdriver
# # # # # from selenium.webdriver.common.keys import Keys

# # # # # # create a new Firefox session
# # # # # driver = webdriver.Firefox()
# # # # # driver.implicitly_wait(30)
# # # # # driver.maximize_window()
# # # # # print("1")
# # # # # # Navigate to the application home page
# # # # # driver.get("http://www.google.com")
# # # # # print("2")
# # # # # # get the search textbox
# # # # # # # # search_field = driver.find_element_by_id("q")
# # # # # search_field = driver.find_element_by_id("lst-ib")
# # # # # print("3")
# # # # # search_field.clear()
# # # # # print("4")
# # # # # # enter search keyword and submit
# # # # # search_field.send_keys("Selenium WebDriver Interview questions")
# # # # # print("5")
# # # # # search_field.submit()
# # # # # print("6")

# # # # # # get the list of elements which are displayed after the search
# # # # # # currently on result page using find_elements_by_class_name method
# # # # # lists= driver.find_elements_by_class_name("_Rm")

# # # # # # get the number of elements found
# # # # # print ("Found " + str(len(lists)) + " searches:")

# # # # # # iterate through each element and print the text that is
# # # # # # name of the search

# # # # # i=0
# # # # # for listitem in lists:
   # # # # # print (listitem.get_attribute("innerHTML"))
   # # # # # i=i+1
   # # # # # if(i>10):
      # # # # # break

# # # # # # close the browser window
# # # # # driver.quit()

# # from selenium.webdriver import Firefox
# # from selenium.webdriver.firefox.options import Options
# # opts = Options()
# # opts.set_headless()
# # assert opts.headless  # Operating in headless mode
# # browser = Firefox(options=opts)
# # browser.get('https://duckduckgo.com')



# # # # # from selenium import webdriver

# # # # # EXE_PATH = r'path\to\chromedriver.exe'
# # # # # driver = webdriver.Chrome()
# # # # # driver.get('https://google.com')
# # # # # element = driver.find_element_by_class_name('gLFyf gsfi')
# # # # # element.send_keys(Keys.CONTROL, 'a')
# # # # # element.send_keys("")



from selenium import webdriver

driver = webdriver.Chrome()
driver.maximize_window()
driver.get("http://www.seleniumeasy.com/test/basic-first-form-demo.html")
assert "Selenium Easy Demo - Simple Form to Automate using Selenium" in driver.title

eleUserMessage = driver.find_element_by_id("user-message")
eleUserMessage.clear()
eleUserMessage.send_keys("Test Python")

eleShowMsgBtn=driver.find_element_by_css_selector('#get-input > .btn')
eleShowMsgBtn.click()

eleYourMsg=driver.find_element_by_id("display")
assert "Test Python" in eleYourMsg.text
driver.close()