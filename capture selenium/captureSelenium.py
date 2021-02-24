from selenium import webdriver

url = 'https://stackoverflow.com/'

path = '/path/to/save/in/scrape.png'
driver = webdriver.Chrome()
driver.get(url)
el = driver.find_element_by_tag_name('body')
el.screenshot(path)
driver.quit()