#!/usr/bin/env bash
host=$1
port=$2
keyfile="eyoc@$host:$port"

./eyoc-client-raw.sh $host $port "./enc-aes-256.sh ~/.keys/$keyfile | ./one-line.sh" "./dec-aes-256.sh ~/.keys/$keyfile"
