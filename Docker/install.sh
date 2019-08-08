#!/usr/bin/env bash

# install dependencies
sudo apt update && sudo apt install docker-ce
# TODO: make distribution-agnostic, works only on debian derivatives for now..

rm -rf 3dp.rocks
git clone https://github.com/MarkDurbin104/3dp.rocks.git

docker image rm -f litophane:latest
docker build . -t lithophane:latest





