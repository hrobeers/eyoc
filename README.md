eyoc
====

Encrypt Your Own Chat - a toolbox to compose your own end-to-end encrypted chatbox.
Walk through the quickstart to experience the look and feel of the application.
Follow the tutorial to run your own encrypted chatbox.


Rationale
---------

Many chat applications claim to implement end-to-end encrypted transport of messages.
While most of them probably do, the code-bases are often too large or even non-disclosed, raising the bar for inspection and review.

This toolbox aims at providing a set of utilities allowing to quickly assemble a simple end-to-end encrypted chatbox in a few lines of code leveraging the power of well established and thoroughly reviewed external toolboxes like openssl in a very transparent way.

However, this toolbox does not provide any guarantees, including but not limited to, security and attack resistance.
This toolbox allows the user to set up a simple encrypted chat box in minutes including a full read of the used source code.


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