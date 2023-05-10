#!/bin/bash -eux

pip3 uninstall -y ansible
dnf clean all
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
