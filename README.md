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

Install the eyoc tools or add the bin folder to your path.
```bash
sudo ./install.sh /usr/local
```

Start the server
```bash
eyoc-server 5555
```

Connect a client (not encrypted)
```bash
eyoc-client-raw localhost 5555
```

Connect a second client with different user name (not encrypted)
```bash
USER="different user" eyoc-client-raw localhost 5555
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

This tutorial will quickly guide you through the setup and data flow of the eyoc system.
eyoc is an acronym for "Encrypt Your Own Chat", not for "run an encrypted chat".
Therefore it is important that the operator en preferably it's users understand it's data flow.

### Installation

Run the install script providing the installation prefix.
```bash
sudo ./install.sh /usr/local
```

Or add the bin folder to your path.
```bash
export PATH="$(pwd)/bin:$PATH"
```

You can later uninstall eyoc using the uninstall script.
```bash
sudo ./uninstall.sh
```
The uninstall script figures out where eyoc is installed and removes it from that location.

### Running the server

The server code is roughly equivalent to running the single line of code illustrated below.
Some extra lines are added to clean up the log file after exit and to print out the chat messages when they come in.
```bash
PORT=5555; socat -ddd TCP-LISTEN:$PORT,fork,reuseaddr SYSTEM:"cat >> /tmp/eyoc_log | tail -f /tmp/eyoc_log"
```

Dissecting the server code:
- `TCP-LISTEN:$PORT,fork,reuseaddr`: The server listens to multiple client connections over TCP.
- `cat >> /tmp/eyoc_log`: Every client connection appends all received messages to the same file on disk.
- `tail -f /tmp/eyoc_log`: Every client connection watches the same file on disk and send them to there connected client when new messages are added.

See if you can figure out the server code in libexec/eyoc/eyoc-server.sh and start a server instance (the single line server above should also work).
```bash
eyoc-server 5555
```

Use netcat as a simple and a bit awkward chat client to test out the server command, use multiple instances to have a chat.
```bash
nc localhost 5555
```

Note that the tail command also sends the last couple of messages when a connection is established, providing a newly connected client the last lines of the chat to catch up. Check out the tail command to find out how you can increase or decrease the amount of history sent upon connection.

Also note that the above server does not authenticate clients and that anyone can read and write messages to it.
Encryption of the messages would make sure that only recipients knowing the encryption key are able to decode the messages.
A message authentication scheme can be introduced server side in order to ignore messages sent by malicious entities.