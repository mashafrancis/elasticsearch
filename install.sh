#!/bin/sh

docker pull docker.elastic.co/elasticsearch/elasticsearch:8.4.2
docker network create elastic
docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 -it docker.elastic.co/elasticsearch/elasticsearch:8.4.2
