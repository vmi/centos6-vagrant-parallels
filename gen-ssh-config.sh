#!/bin/bash

### Generate ssh-config.sh from "vagrant ssh-config".

set -eux

conf="ssh-config.sh"

vagrant ssh-config | tee ssh-config | awk '
  /[^ ]/ { print "vagrant_" $1 "=\"" $2 "\"" }
' > "$conf"
