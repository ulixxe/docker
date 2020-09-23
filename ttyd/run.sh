#!/bin/bash

mkdir -p home/ttyd
docker container run -t --name ttyd -p 7681:7681 ttyd:latest
