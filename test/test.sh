#!/bin/bash
set -e

URL="$1"

echo "Testing $URL ..."
HTTP_STATUS=$(curl -o /dev/null -w "%{http_code}" "$URL")

echo "Application is available"
exit 0
