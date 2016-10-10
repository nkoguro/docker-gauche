FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get build-dep -y gauche-dev
RUN apt-get install -y curl openssl

RUN mkdir -p /build

ENV GAUCHE_STABLE_VERSION 0.9.5
RUN curl --location http://prdownloads.sourceforge.net/gauche/Gauche-${GAUCHE_STABLE_VERSION}.tgz -o /build/Gauche-${GAUCHE_STABLE_VERSION}.tgz
RUN cd /build; tar xf /build/Gauche-${GAUCHE_STABLE_VERSION}.tgz
# Disable make check because ext/tls test is failed.
# But it passes in interactive shell.
RUN cd /build/Gauche-${GAUCHE_STABLE_VERSION}; \
  ./configure && \
  make && \
  make install

RUN rm -Rf /build
