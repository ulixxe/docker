#!/bin/bash

docker container run -ti --rm -v$(pwd):/work gforth:latest
