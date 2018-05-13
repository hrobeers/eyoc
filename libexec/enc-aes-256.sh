#!/usr/bin/env bash
openssl aes-256-cbc -md sha256 -a -salt -pass file:"$1"