#!/bin/bash

NEXT_IMAGE_ID=$1
MAILING_LIST_IMAGE_ID=$2
NETWORK=solar-garlic-band

docker container rm -f nginx
docker container rm -f nextjs
docker container rm -f mailinglist

docker run --rm -d --name nextjs --network $NETWORK $NEXT_IMAGE_ID
docker run --rm -d --name mailinglist --network $NETWORK --env-file .env.mailinglist -v $(pwd)/mailing-list.db:/mailing-list.db -v /etc/resolv.conf:/etc/resolv.conf --dns 8.8.8.8 -p 25:25 -p 587:587 -p 465:465 $MAILING_LIST_IMAGE_ID
docker run --rm -d -p 80:80 -p 443:443 --name nginx --network $NETWORK solar-garlic-nginx:latest