#!/bin/bash

REPO=$1 # like solargarlicband/website or solargarlicband/mailing-list
TAG=$2

docker image pull 339712990370.dkr.ecr.us-west-1.amazonaws.com/$REPO:$TAG