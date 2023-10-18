#!/bin/bash
echo "Initializing replica set..."

# This will block until MongoDB has started
until mongo --quiet --eval "db.adminCommand('ping')"; do
    sleep 2
done

# Initiate the replica set
mongo --quiet <<EOF
rs.initiate({
    _id: "dbrs",
    version: 1,
    members: [{
        _id: 0,
        host: "localhost:27017"
    }]
});
EOF

echo "Replica set initialized."
    