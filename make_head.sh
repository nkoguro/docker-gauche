#!/bin/sh

docker build -t nkoguro/gauche head
docker tag nkoguro/gauche nkoguro/gauche:head
