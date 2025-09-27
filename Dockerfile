FROM python:3.14.0rc3-slim
WORKDIR /app
RUN apt-get update
RUN pip install flask
CMD ['python' 'app.py']
