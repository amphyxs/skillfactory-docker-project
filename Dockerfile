FROM python:3.11-slim

RUN mkdir /srv/app
VOLUME [ "/srv/app" ]
RUN apt update && apt install -y libpq-dev
COPY requirements.txt .
RUN pip install -r requirements.txt  
CMD python /srv/app/web.py
