#!/usr/bin/env bats

BD=${BATS_TEST_DIRNAME}/../bin
PORT=5000

@test "server: message echo" {
    ${BD}/eyoc-server $PORT 3>&- &
    server_pid=$!
    MSG="echo this message"
    result=$(cat <(echo "$MSG"; sleep 0.1) | nc localhost $PORT -c) || true
    kill $server_pid
    [ "$result" == "$MSG" ]
}
