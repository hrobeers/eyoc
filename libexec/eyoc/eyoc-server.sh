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

set -e
set -u

port=$1

# Create temporary log file
eyoc_log=$(mktemp -t eyoc.log.XXXXXXXXX)
tail -f $eyoc_log &

# Define cleanup procedure
cleanup() {
  rm $eyoc_log
  kill 0
}
trap "exit" SIGTERM SIGINT
trap cleanup EXIT

# Run the server
socat -ddd TCP-LISTEN:$port,fork,reuseaddr SYSTEM:"cat >> $eyoc_log | tail -f $eyoc_log" &

# Loop unit terminated
 while :; do sleep 1; done
