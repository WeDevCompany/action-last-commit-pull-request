#!/bin/bash

PR=$(curl -i -H "Authorization: token ${INPUT_TOKEN}" ${INPUT_PULLREQUEST}/commits?page=last)

# Final env
echo $PR
echo "::set-output name=env::$PR"

