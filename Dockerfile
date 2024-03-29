FROM python:3.9-slim-buster

COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

RUN mkdir -p /allocation
COPY allocation/ /allocation/
RUN pip install -e /allocation
COPY tests/ /tests/

WORKDIR /allocation
ENV FLASK_APP=entrypoints/flask_app.py FLASK_DEBUG=1 PYTHONUNBUFFERED=1
CMD flask run --host=0.0.0.0 --port=80



