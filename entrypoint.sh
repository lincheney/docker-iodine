#!/bin/bash
if [ ! -e /dev/net/tun ]; then
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200
fi

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

exec iodined "$@"
