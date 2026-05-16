#!/bin/bash
vmware-hgfsclient
sudo mkdir -p /mnt/hgfs/
sudo /usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs/ -o subtype=vmhgfs-fuse,allow_other
