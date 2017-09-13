#!/bin/bash

docker build -t better-files .
docker run --rm better-files sbt +test
