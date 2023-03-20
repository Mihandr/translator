FROM python:3.9-alpine

ENV CELERY_BROKER_URL redis://redis:6379/0
ENV CELERY_RESULT_BACKEND redis://redis:6379/0
ENV C_FORCE_ROOT true
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

COPY . /file_docker
WORKDIR /file_docker

RUN pip install -U setuptools pip
RUN pip install -r requirements.txt

EXPOSE 5001
CMD ["flask", "run"]
