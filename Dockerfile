ARG PYTHON_VER=3.9.9-slim-buster
FROM python:$PYTHON_VER

ARG IPPSERVER_VER=0.2
ARG PIP_VER=21.3.1
RUN echo ippserver: $IPPSERVER_VER, pip: $PIP_VER

RUN pip3 install pip==$PIP_VER
RUN pip3 install ippserver==$IPPSERVER_VER

EXPOSE 6310

ENTRYPOINT [ "ippserver" ]
CMD [ "-v", "-H", "0.0.0.0", "-p", "6310", "reject" ]
