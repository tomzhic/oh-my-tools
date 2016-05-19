#!/bin/sh
source ~/.winixrc

if [ ! -d "/mnt" ]; then
    mkdir /mnt
else
    rm -rf /mnt/*
fi

for node in `mount | grep "noumount" |  awk '{print $3}'`; do
    ln -s $node /mnt/$node
done

echo "Mount Successfully"
