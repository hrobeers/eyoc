#!/usr/bin/env bats

BD=${BATS_TEST_DIRNAME}/../bin
PORT=5000

@test "server: message echo" {
    # startup test server
    ${BD}/eyoc-server $PORT 3>&- &
    server_pid=$!

    # give server time to start listening
    sleep 0.1

    # send echo message and wait for response
    MSG="echo this message"
    result=$(echo "$MSG" | socat TCP:localhost:$PORT -) || true
    # netcat (nc) can be used instead of socat,
    # but for testing we need the -c option which is not available in all implementations (busybox)
    # The commented line below does exactly that
    #result=$(cat <(echo "$MSG"; sleep 0.1) | nc localhost $PORT -c) || true

    # cleanup the server process
    kill $server_pid
    [ "$result" == "$MSG" ]
}
