FROM python:3.6-alpine

RUN adduser -D tinyblog

WORKDIR /home/tinyblog

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY tinyblog.py config.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP tinyblog.py

RUN chown -R tinyblog:tinyblog ./
USER tinyblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]