#!/bin/bash

docker-compose up 

sleep 10

docker exec -it mongo.one.db mongosh --eval "rs.initiate({_id:'dbrs', members: [{_id:0, host: 'mongo.one.db'},{_id:1, host: 'mongo.two.db'},{_id:2, host: 'mongo.three.db'}]})"
