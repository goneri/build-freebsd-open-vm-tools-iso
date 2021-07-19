#!/usr/bin/env bash

sudo pkg install -y curl git
ISO=FreeBSD-13.0-RELEASE-amd64-dvd1.iso
test -f ${ISO} || curl -LO https://download.freebsd.org/ftp/releases/ISO-IMAGES/13.0/${ISO}
test -d /mnt/bin || sudo mount -t cd9660 /dev/$(sudo mdconfig -f ${ISO}) /mnt
test -d mfsbsd || git clone https://github.com/mmatuska/mfsbsd
echo "open-vm-tools-nox11" > mfsbsd/tools/packages
(
    cd mfsbsd
    sudo make clean
    sudo make iso BASE=/mnt/usr/freebsd-dist
)
