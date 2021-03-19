FROM python:3.7.10-alpine3.12

RUN pip3 install django

COPY manage.py .
COPY sample_server sample_server

EXPOSE 8000

CMD ["python3", "manage.py", "runserver"]