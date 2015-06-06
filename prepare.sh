#!/bin/bash

set -eux

conf="ssh-config.sh"

test -f "$conf" || ./gen-ssh-config.sh

. "$conf"

knife solo prepare "$vagrant_Host" --ssh-config-file ssh-config
