from selenium import webdriver
driver = webdriver.Firefox()
executor_url = ""
session_id = ""

# --- Load file Session
fileIn = 'infoSession.txt'
with open(fileIn,'r') as fIn:
    lines = fIn.readlines()
    noLine = 0
    
    if len(lines) == 4:
        executor_url = ' '.join(lines[1].split())
        session_id = ' '.join(lines[3].split())
    else:
        print("file input not valid")

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

driverNew = create_driver_session(session_id, executor_url)
driverNew.get("http://www.github.com")