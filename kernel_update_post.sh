#!/bin/env sh

if [ "$1" == "" ]; then
    echo "Enter kernel version for mkinitrd"
    echo "$0 <version>"
    echo "eg. $0 $(uname -r)"
    exit
fi

sh /usr/share/mkinitrd/mkinitrd_command_generator.sh -k $1 | sh
cd /boot/
cp -v initrd.gz efi/EFI/Slackware/initrd.gz
cp -vL vmlinuz-generic efi/EFI/Slackware/vmlinuz
cd -
