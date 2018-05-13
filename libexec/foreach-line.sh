#!/usr/bin/env bash

while read line
do
  echo "$line" | eval $@
done
