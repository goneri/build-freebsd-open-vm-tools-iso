#!/bin/bash
vl start freebsd-13.0-zfs --name mfsbsd --memory 4096
scp build.sh $(vl status |awk '/mfsbsd/ {print $4}'):
ssh $(vl status |awk '/mfsbsd/ {print $4}') bash build.sh
scp $(vl status |awk '/mfsbsd/ {print $4}'):mfsbsd/mfsbsd-13.0-RELEASE-amd64.iso .
vl stop mfsbsd
