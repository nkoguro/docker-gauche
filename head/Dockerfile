FROM nkoguro/gauche:stable

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git libtool

RUN mkdir -p /build

RUN git clone git://github.com/shirok/Gauche.git /build/Gauche
RUN cd /build/Gauche; \
  ./DIST gen && \
  ./configure && \
  make && \
  make check && \
  make install

RUN rm -Rf /build
