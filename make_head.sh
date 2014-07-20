#!/bin/sh

docker build --no-cache -t nkoguro/gauche head
docker tag nkoguro/gauche nkoguro/gauche:head
