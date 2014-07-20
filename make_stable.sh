#!/bin/sh

docker build --no-cache -t nkoguro/gauche:stable stable
docker tag nkoguro/gauche:stable nkoguro/gauche:0.9.4
