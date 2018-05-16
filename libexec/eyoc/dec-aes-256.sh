#!/usr/bin/env bash
openssl aes-256-cbc -md sha256 -d -a -pass file:"$1"
