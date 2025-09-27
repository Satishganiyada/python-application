FROM 3.14.0rc3-alpine3.22
WORKDIR /app
RUN apt-get update
RUN pip install flask
CMD ['python' 'app.py']
