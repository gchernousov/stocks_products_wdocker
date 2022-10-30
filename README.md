### Содержимое Dockerfile:

```
FROM python:3.9

COPY ./requirements.txt /src/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /src/requirements.txt

COPY . /src

EXPOSE 8000

WORKDIR src

RUN python manage.py migrate

CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
```

Далее создадим образ на основе Dockerfile:
> docker build -t название_образа .

Т.е. при создании образа произойдут следующие действия:
1. Скачается Python версии 3.9
2. Скопируется файл зависимостей
3. Все зависимости установятся
4. Скопируются остальные файлы проекта в папку src
5. Будет выделен порт 8000
6. Корневой директорией будет src
7. Применятся миграции
8. И последней командой будет запущен проект

Запускаем контейнер:
> docker run -d -p порт:8000 название_образа

По адресу localhost:порт мы сможем зайти в наше приложение
А по адресам api/v1/stocks и api/v1/products сможем отправлять POST и GET запросы к складам и продуктам