from fastapi import FastAPI, Request, Form, HTTPException
from fastapi.templating import Jinja2Templates
import uvicorn
from PIL import Image
from fastapi.staticfiles import StaticFiles
import requests
import matplotlib.pyplot as plt
import numpy as np


app = FastAPI()
# указываем папку с шаблонами
templates = Jinja2Templates(directory="templates")
# монтируем папку static
app.mount("/static", StaticFiles(directory="static"), name="static")
# возвращаем основной обработанный шаблон index.html
@app.get("/")
def read_root(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})
# обрабатываем post запрос с данными формы и Captcha
@app.post("/rotate_cross")
async def rotate_cross(request:Request, angle:int = Form(), resp:str = Form()):
    secret_key = "6Le77c4pAAAAACpowdtBWUBMmK1Wpw61jgW_hphO" # Замените на ваш секретный ключ
    # подготовим секретный ключ и ответ пришедший от браузера со стороны клиента
    payload = {
    "secret": secret_key,
    "response": resp
    }
 # посылаем post запрос на сайт Google для проверки прохождения Captcha
    response = requests.post("https://www.google.com/recaptcha/api/siteverify", data=payload)
    result = response.json()
    print(result)
    if result["success"]:
        # Открыть изображение которое лежит в папке static
        with Image.open(f"./static/bab.jpg") as img:
            # Rotate the image by the specified angle
            rotated_img = img.rotate(angle)
            # Save the rotated image with a new filename
            rotated_img.save(f"./static/_rotated.jpg")
            # Получаем данные о цвете изображения
            original_img_colors = np.array(rotated_img.convert("RGB")).reshape(-1, 3)# данные о цвете пикселей
            # Создаем гистограмму для исходного изображения
            plt.figure(figsize=(10, 5))#создаем график
            plt.subplot(1, 2, 1)
            #строим гистограмму
            plt.hist(original_img_colors, bins=range(256), color=['r', 'g', 'b'], histtype='barstacked', alpha=0.75)
            plt.title('Original Image Color Distribution')
            plt.xlabel('значение пикселя')
            plt.ylabel('частота пикселей')

            # Получить данные о цвете измененного изображения
            rotated_img_colors = np.array(rotated_img.convert("RGB")).reshape(-1, 3)
            # Создаем гистограмму для измененного изображения
            plt.subplot(1, 2, 2)
            plt.hist(rotated_img_colors, bins=range(256), color=['r', 'g', 'b'], histtype='barstacked', alpha=0.75)
            plt.title('Rotated Image Color Distribution')
               # Сохраняем график в файл
            plt.savefig('./static/color_distribution.png')
            # Возвращаем имя файла графика
        return templates.TemplateResponse("result.html", {"request": request, "filename": "_rotated.jpg","color_distribution": "color_distribution.png"})
    else:
        # в случае неуспеха проверки Captcha возвращаем 400
        raise HTTPException(status_code=400, detail="Ошибка проверки капчи")
# запускаем локально веб сервер
if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)

