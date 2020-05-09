#!/bin/sh

# ------------------------------------------------------------------------------
# Gluster/nfs-ganesha Config Script
# ------------------------------------------------------------------------------


# Install some custom files
cp /data/mnt-ganesha.mount /lib/systemd/system/
cp /data/ganesha.conf /etc/ganesha/


# Enable Services
ln -s /lib/systemd/system/glusterd.service /etc/systemd/system/multi-user.target.wants/glusterd.service
ln -s /lib/systemd/system/nfs-ganesha.service /etc/systemd/system/multi-user.target.wants/nfs-ganesha.service

mkdir -p /etc/systemd/system/network-fs.target.wants/
mkdir -p /etc/systemd/system/nfs-ganesha.service.wants/

ln -s /usr/lib/systemd/system/mnt-ganesha.mount /etc/systemd/system/network-fs.target.wants/mnt-ganesha.mount
ln -s /usr/lib/systemd/system/mnt-ganesha.mount /etc/systemd/system/nfs-ganesha.service.wants/mnt-ganesha.mount

