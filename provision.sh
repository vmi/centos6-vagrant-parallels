#!/bin/bash

set -eu

# List tlds separated by comma.
yum_mirror_tlds=.jp

# Configuration file.
fastestmirror_conf=/etc/yum/pluginconf.d/fastestmirror.conf

# Change yum mirror configuration.
if [ -n "${yum_mirror_tlds:-}" ]; then
  if grep -q "include_only=" "$fastestmirror_conf"; then
    sed -r -i.bak "s/^#? *(include_only)=.*/\\1=$yum_mirror_tlds/" "$fastestmirror_conf"
  else
    echo "include_only=$yum_mirror_tlds" >> "$fastestmirror_conf"
  fi
fi

# yum update.
yum -y update
