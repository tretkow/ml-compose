
FROM jupyter/scipy-notebook

USER root

RUN apt-get update && \
    apt install build-essential wget -y

RUN wget https://artiya4u.keybase.pub/TA-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install

USER $NB_UID

RUN pip install \
    TA-lib
    