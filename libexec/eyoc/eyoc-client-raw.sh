#!/usr/bin/env bash

#    Copyright (C) 2018  hrobeers
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

host=$1
port=$2
encode=${3:-cat}
decode=${4:-cat}
username=$USER

read -d '' banner <<- EOF
#####################################################################
    eyoc-client  Copyright (C) 2018  hrobeers
    This program comes with ABSOLUTELY NO WARRANTY.
    This is free software, and you are welcome to redistribute it
    under under the terms of the GNU General Public License v3.

    To exit this application press Ctrl+C twice.
#####################################################################
EOF

# Create named pipes for communication
eyoc_fifo_in=$(mktemp /tmp/eyoc.fifo.XXXXXXXXX --dry-run)
mkfifo $eyoc_fifo_in

# Define cleanup procedure
cleanup() {
  rm $eyoc_fifo_in
}
trap cleanup EXIT

# Prepare the commands attached to send and receive panes
send_cmd="while read line; do echo \"<$username> \$line\" 1>&2; clear; done 2> $eyoc_fifo_in"
recv_cmd="cat $eyoc_fifo_in | foreach-line.sh \"$encode  | one-line.sh\" | nc $host $port | foreach-line.sh \"$decode\""

# Run tmux with commands attached
tmux \
    new-session "echo \"$banner\" && $recv_cmd" \; \
    split-window "$send_cmd" \; \
    resize-pane -y 2

