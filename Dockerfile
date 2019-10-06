FROM python:2.7-stretch

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /code
WORKDIR /code
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . /code/

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]