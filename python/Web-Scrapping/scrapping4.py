from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv
from time import sleep

opts = Options()
opts.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36")


driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)
driver.get('https://github.com/login')
sleep(2)

username_input = driver.find_element(By.ID, 'login_field')
password_input = driver.find_element(By.ID, 'password')

username_input.send_keys("ingjorge")
with open('./password.txt') as file:
    password = file.readline().strip()

password_input.send_keys(password)

driver.find_element(By.NAME, 'commit').click()
sleep(20)
linkRepo= WebDriverWait(driver, 5).until(EC.presence_of_element_located((By.XPATH, "//a[@href='/ingjorge/prueba']")))
linkRepo.click()
sleep(3)
try:
    comandos= driver.find_elements(By.XPATH, "//pre[@id='empty-setup-new-repo-echo']/span")
    comanList = [comando.text for comando in comandos]
    print(comanList)
except Exception as e:
    print(f"Error al extraer los comandos: {e}")

driver.quit()



