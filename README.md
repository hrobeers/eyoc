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
It should be handled as an educational work that can serve as the basis for assembling a safe and securely operated chatbox.


Currently Known Limitations
-----------------

This toolbox is aimed at being simple and transparent to it's users and operators.
Therefore, limitations in functionality and security are unavoidable, and this toolbox should be handled as an educational work that can serve as the basis for assembling a safe and securely operated chatbox.

The limitations include but are not limited to the ones listed below.
- Denial of service attacks on the eyoc-server are trivial.
- Identity verification is currently not implemented, impersonation is trivial.
- Encryption key distribution and management is left to the user.
- Code injection vulnerabilities are likely to exist.

Most of the above listed limitations can be overcome by plugging extra tools into the client or server's pipeline.


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