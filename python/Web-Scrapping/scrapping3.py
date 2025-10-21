from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from time import sleep

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

opts = Options()
opts.add_argument("user-agent=Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36")

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)

driver.get("https://www.airbnb.com/")
# sleep(1)
wait = WebDriverWait(driver, 10)
wait.until(EC.presence_of_all_elements_located((By.XPATH, "//div[@data-testid='listing-card-title']")))


last_height = driver.execute_script("return document.body.scrollHeight")
while True:
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight")
    time.sleep(3)
    new_height = driver.execute_script("return document.doby.scrollHeight")
    if new_height == last_height:
        break
    last_height = new_height

titulos_anuncios =[ titulo.text for titulo in driver.find_elements(By.XPATH, "//div[@data-testid='listing-card-title']") ]
print(titulos_anuncios)

driver.quit()
