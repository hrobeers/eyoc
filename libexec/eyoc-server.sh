#!/usr/bin/env bash

port=$1

chat_log=$(mktemp /tmp/chat.log.XXXXXXXXX)
tail -f $chat_log &
log_pid=$!
socat -ddd TCP-LISTEN:$port,fork,reuseaddr SYSTEM:"cat >> $chat_log | tail -f $chat_log"
kill $log_pid
rm $chat_log
