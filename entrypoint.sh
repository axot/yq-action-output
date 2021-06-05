#!/bin/sh -l

echo "$1"
RESULT=$(eval "$1")
echo "::debug::\$RESULT: $RESULT"
echo ::set-output name=result::"$RESULT"
