#!/bin/sh

docker build -t nkoguro/gauche:stable stable
docker tag nkoguro/gauche:stable nkoguro/gauche:0.9.4
