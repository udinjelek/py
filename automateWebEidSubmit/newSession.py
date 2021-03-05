from selenium import webdriver

driver = webdriver.Firefox()
executor_url = driver.command_executor._url
session_id = driver.session_id
driver.get("http://www.google.com")

# --- Write file Session
textNow = "executor_url :\n" + executor_url + "\nsession_id :\n" + session_id
fileLog = open('infoSession.txt', "w")	
fileLog.write(textNow)
fileLog.close()

print(executor_url,session_id)
def create_driver_session(session_id, executor_url):
    from selenium.webdriver.remote.webdriver import WebDriver as RemoteWebDriver

    # Save the original function, so we can revert our patch
    org_command_execute = RemoteWebDriver.execute

    def new_command_execute(self, command, params=None):
        if command == "newSession":
            # Mock the response
            return {'success': 0, 'value': None, 'sessionId': session_id}
        else:
            return org_command_execute(self, command, params)

    # Patch the function before creating the driver object
    RemoteWebDriver.execute = new_command_execute

    new_driver = webdriver.Remote(command_executor=executor_url, desired_capabilities={})
    new_driver.session_id = session_id

    # Replace the patched function with original function
    RemoteWebDriver.execute = org_command_execute

    return new_driver

#driver2 = create_driver_session(session_id, executor_url)