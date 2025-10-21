#pip install webdriver-manager
#pip install selenium

from selenium.webdriver.common.by import By
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import csv
import time

opts = Options()
opts.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36")

driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=opts)
driver.get('https://www.airbnb.com/')

# Espera hasta que se cargue el primer anuncio
wait = WebDriverWait(driver, 15)
wait.until(EC.presence_of_element_located((By.XPATH, '//div[@data-testid="listing-card-title"]')))

# Realiza scroll progresivo para cargar más anuncios
last_height = driver.execute_script("return document.body.scrollHeight")
while True:
    driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    # Espera a que se cargue el contenido
    time.sleep(3)
    new_height = driver.execute_script("return document.body.scrollHeight")
    # Si no se ha cargado más contenido, sal del loop
    if new_height == last_height:
        break
    last_height = new_height

# Una vez que se realizó el scroll, extraemos la información
titulos_anuncios = [titulo.text for titulo in driver.find_elements(By.XPATH, '//div[@data-testid="listing-card-title"]')]
subtitulos = [subtitulo.text for subtitulo in driver.find_elements(By.XPATH, '//div[@data-testid="listing-card-subtitle"]')]
precios = [precio.text for precio in driver.find_elements(By.XPATH, '//div[@data-testid="price-availability-row"]')]
precios_limpios = []
for precio in precios:
    if " por noche" in precio:
        precios_limpios.append(precio.replace(" por noche", "").strip())
    else:
        precios_limpios.append(precio)

print(f"Se encontraron {len(titulos_anuncios)} titulos, {len(subtitulos)} subtítulos y {len(precios)} precios.")

with open("airbnb_data.csv", "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Titulo", "Subtitulo", "Precio"])
    for tituloe, subtitulo, precio in zip(titulos_anuncios, subtitulos, precios):
        writer.writerow([tituloe, subtitulo, precio])

driver.quit()
