#!/bin/bash

docker build -t "cannable/gluster" -f ./Dockerfile $* .
