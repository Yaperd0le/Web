# from flask import Flask, render_template, request
# from flask_wtf import FlaskForm, RecaptchaField
# from wtforms import StringField, SubmitField, TextAreaField
# from wtforms.validators import DataRequired
# from flask_wtf.file import FileField, FileAllowed, FileRequired
# from werkzeug.utils import secure_filename
# import os
# import net as neuronet
# from flask_bootstrap import Bootstrap
#
# app = Flask(__name__)
# app.config['SECRET_KEY'] = 'secret'
# app.config['RECAPTCHA_USE_SSL'] = False
# app.config['RECAPTCHA_PUBLIC_KEY'] = '6Le77c4pAAAAAJ1xcz0fSRIeVyum-9F3Ag3eAozM'
# app.config['RECAPTCHA_PRIVATE_KEY'] = '6Le77c4pAAAAACpowdtBWUBMmK1Wpw61jgW_hphO'
# app.config['RECAPTCHA_OPTIONS'] = {'theme': 'black'}
#
# class NetForm(FlaskForm):
#     openid = StringField('angle', validators=[DataRequired()])
#     upload = FileField('Load image', validators=[FileRequired(), FileAllowed(['jpg', 'png', 'jpeg'], 'Images only!')])
#     recaptcha = RecaptchaField()
#     submit = SubmitField('send')
#
# bootstrap = Bootstrap(app)
#
# @app.route("/net", methods=['GET', 'POST'])
# def net():
#     form = NetForm()
#     filename = None
#     neurodic = {}
#
#     if form.validate_on_submit():
#         filename = os.path.join('./static', secure_filename(form.upload.data.filename))
#         if not os.path.exists('./static'):
#             os.makedirs('./static')
#         fcount, fimage = neuronet.read_image_files(10, './static')
#         decode = neuronet.getresult(fimage)
#         for elem in decode:
#             neurodic[elem[0][1]] = elem[0][2]
#         form.upload.data.save(filename)
#
#     return render_template('net.html', form=form, image_name=filename, neurodic=neurodic)
#
# if __name__ == '__main__':
#     app.run(debug=True)
#
#
#
# from flask import Flask, render_template, request, redirect, url_for
# from PIL import Image
# import io
# import base64
#
# app = Flask(__name__)
#
# app.config['SECRET_KEY'] = 'secret'
# app.config['RECAPTCHA_USE_SSL'] = False
# app.config['RECAPTCHA_PUBLIC_KEY'] = '6Le77c4pAAAAAJ1xcz0fSRIeVyum-9F3Ag3eAozM'
# app.config['RECAPTCHA_PRIVATE_KEY'] = '6Le77c4pAAAAACpowdtBWUBMmK1Wpw61jgW_hphO'
# app.config['RECAPTCHA_OPTIONS'] = {'theme': 'black'}
# @app.route('/')
# def index():
#     return render_template('index.html')
#
#
# @app.route('/upload', methods=['POST'])
# def upload():
#     if 'file' not in request.files:
#         return "No file part"
#     file = request.files['file']
#     if file.filename == '':
#         return "No selected file"
#     if file:
#         img = file.read()
#         angle = int(request.form['angle'])
#         img = Image.open(io.BytesIO(img))
#         img = img.rotate(angle)
#
#         # Преобразование изображения в строку base64
#         buffered = io.BytesIO()
#         img.save(buffered, format="JPEG")
#         img_str = base64.b64encode(buffered.getvalue()).decode('utf-8')
#
#         return render_template('result.html', img_data=img_str)
#
#
# if __name__ == '__main__':
#     app.run()

# 'эксперементы


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
        return templates.TemplateResponse("result.html", {"request": request, "filename": f"_rotated.jpg","color_distribution": "color_distribution.png"})
    else:
        # в случае неуспеха проверки Captcha возвращаем 400
        raise HTTPException(status_code=400, detail="Ошибка проверки капчи")
# запускаем локально веб сервер
if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)

