#!/bin/bash

# Replace the placeholders with your actual values
HOSTNAME="<hostname>"
PORT="<port>"
USERNAME="<username>"
PASSWORD="<password>"
DATABASE="<database_name>"
MEASUREMENT="<measurement_name>"
OUTPUT_FILE="data.csv"

# Connect to InfluxDB and export data in CSV format
influx -host "$HOSTNAME" -port "$PORT" -username "$USERNAME" -password "$PASSWORD" -database "$DATABASE" <<EOF
precision rfc3339
FORMAT CSV

SELECT * FROM "$MEASUREMENT" > "$OUTPUT_FILE"

EOF
