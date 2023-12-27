FROM python:3.11-slim as base

RUN apt update && apt install -y libpq-dev
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install -r requirements.txt  
COPY src/web.py /srv/app/web.py
COPY src/web.conf /srv/app/conf/web.conf

FROM python:3.11-slim

COPY --from=base /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
CMD [ "/srv/app" ]
