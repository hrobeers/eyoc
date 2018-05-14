#!/usr/bin/env bash

port=$1

eyoc_log=$(mktemp /tmp/eyoc.log.XXXXXXXXX)
tail -f $eyoc_log &
log_pid=$!
socat -ddd TCP-LISTEN:$port,fork,reuseaddr SYSTEM:"cat >> $eyoc_log | tail -f $eyoc_log"
kill $log_pid
rm $eyoc_log
