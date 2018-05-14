#!/usr/bin/env bash
host=$1
port=$2
encode=${3:-cat}
decode=${4:-cat}
username=$USER

eyoc_fifo_in=$(mktemp /tmp/eyoc.fifo.XXXXXXXXX --dry-run)
mkfifo $eyoc_fifo_in

send_cmd="while read line; do echo \"<$username> \$line\" 1>&2; clear; done 2> $eyoc_fifo_in"
recv_cmd="cat $eyoc_fifo_in | foreach-line.sh \"$encode\" | nc $host $port | foreach-line.sh \"$decode\""

tmux \
    new-session "$recv_cmd" \; \
    split-window "$send_cmd" \; \
    resize-pane -y 2

rm $eyoc_fifo_in
