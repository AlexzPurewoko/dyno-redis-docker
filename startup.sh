#!/bin/bash

#Start redis server on 22122
redis-server --port 22122 &

dynomite --conf-file=/conf/$1 -v5
