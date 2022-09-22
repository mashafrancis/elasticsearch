#!/bin/sh

docker pull docker.elastic.co/beats/heartbeat:8.4.2
# docker run --cap-add=NET_RAW docker.elastic.co/beats/heartbeat:8.4.2 setup -E setup.kibana.host=kibana:5601 -E output.elasticsearch.hosts=["elasticsearch:9200"]
docker run -d \
  --name=heartbeat \
  --user=heartbeat \
  --volume="$(pwd)/heartbeat.docker.yml:/usr/share/heartbeat/heartbeat.yml:ro" \
  --cap-add=NET_RAW \
  docker.elastic.co/beats/heartbeat:8.4.2 \
  --strict.perms=false -e \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]
