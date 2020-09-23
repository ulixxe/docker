#!/bin/bash

if [[ -f cert/server.crt && -f cert/server.key && -f cert/ca.crt ]]; then
  /usr/bin/ttyd --ssl --ssl-cert cert/server.crt --ssl-key cert/server.key --ssl-ca cert/ca.crt bash
else
  /usr/bin/ttyd bash
fi
