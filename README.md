eyoc
====

Encrypt Your Own Chat - a toolbox to compose your own end-to-end ecrypted chatbox.
Walk through the quickstart to experience the look and feel of the application.
Follow the tutorial to run your own encrypted chatbox.


Quickstart
----------

Start the server
```bash
./bin/eyoc-server 5555
```

Connect a client (not encrypted)
```bash
./bin/eyoc-client-raw localhost 5555
```

Connect a second client with different user name (not encrypted)
```bash
USER="different user" ./bin/eyoc-client-raw localhost 5555
```


Dependencies
------------

#### Server
- bash
- socat

#### Client
- bash
- tmux
- netcat
- openssl (for encrypted client)


Tutorial
--------

Coming soon ...