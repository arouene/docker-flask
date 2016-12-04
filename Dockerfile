FROM alpine
MAINTAINER Aurelien Fusil-Delahaye <aurelien.fusil-delahaye@shengis.org>

EXPOSE 5000

RUN apk --update add python python-dev py-pip build-base && pip install flask

ONBUILD COPY . /app
WORKDIR /app

ONBUILD RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

ENTRYPOINT ["/usr/bin/python"]
