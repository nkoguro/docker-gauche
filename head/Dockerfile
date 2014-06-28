FROM nkoguro/gauche-stable

RUN apt-get install -y git

RUN mkdir -p /build

RUN git clone git://github.com/shirok/Gauche.git /build/Gauche
RUN cd /build/Gauche; \
  ./DIST gen && \
  ./configure && \
  make && \
  make check && \
  make install
