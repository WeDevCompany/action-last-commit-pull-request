#!/bin/bash

echo ${INPUT_TOKEN}
echo ${INPUT_PULLREQUEST}
echo curl -i -H "Authorization: token ${INPUT_TOKEN}" ${INPUT_PULLREQUEST}/commits?page=last | jq '[.[] ] | last'

LAST_PR=$(curl -i -H "Authorization: token ${INPUT_TOKEN}" ${INPUT_PULLREQUEST}/commits?page=last | jq '[.[] ] | last')

COMMIT_MESSAGE=$LAST_PR | jq '.commit["message"]'


echo $COMMIT_MESSAGE
echo "::set-output name=env::$COMMIT_MESSAGE"

