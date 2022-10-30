FROM python:3.9

COPY ./requirements.txt /src/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /src/requirements.txt

COPY . /src

EXPOSE 8000

WORKDIR src

RUN python manage.py migrate

CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]