from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

desired_cap = {
 'browserName': 'chrome',
}

driver = webdriver.Remote(
    command_executor='http://localhost:4444/wd/hub',
    desired_capabilities=desired_cap)

driver.get("http://www.inmar.com")

driver.quit()