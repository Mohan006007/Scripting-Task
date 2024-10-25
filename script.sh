#!/bin/bash

http_response=$(curl -s -o /dev/null -w "%{http_code}" -L https://guvi.in)

if [ "$http_response" -eq 200 ]; then
    echo "Success: Guvi.in is accessible (HTTP status: $http_response)"
else
    echo "Failure: Guvi.in might be unreachable (HTTP status: $http_response)"
fi

if [ -z "$1" ]; then
    echo "Please provide a filename as an argument."
    exit 1
fi

sed -i '5,$s/\(.*welcome.*\)give/\1learning/g' "$1"

