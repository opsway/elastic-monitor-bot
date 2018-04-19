#!/bin/bash

STATUS=`/usr/bin/curl -s ${ES}:9200/_cluster/health?pretty | grep status | awk '{print $3}'| cut -d\" -f2`

if [[ "$STATUS" != "green" ]]; then

    MESSAGE="Ealsticsearch have unhealthy status: $STATUS"
    if [ -z "$STATUS" ]; then
         MESSAGE="Elasticsearch cluster is down!"
    fi
    curl -X POST --data-urlencode "payload={\"text\": \"<!here> ${MESSAGE}\"}" ${SLACK}
    echo "NOT OK - $MESSAGE"
fi
