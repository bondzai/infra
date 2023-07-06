#!/bin/bash

# Load environment variables from .env file
if [[ -f ".env" ]]; then
  source .env
fi

# Connect to InfluxDB and export data in CSV format
influx -host "$HOSTNAME" -port "$PORT" -username "$USERNAME" -password "$PASSWORD" -database "$DATABASE" <<EOF
precision rfc3339
FORMAT CSV

SELECT * FROM "$MEASUREMENT" > "$OUTPUT_FILE"

EOF
