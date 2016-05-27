# The kickstart file will perform

# 1. a unattended installation
# 2. set patition /|/boot|/swap|/data|/config|/logging
# 3. set partition to encrypted
# 4. set passphase to none

#Authconfig
authconfig --enableshadow --passalgo=md5

#Keyboard type
keyboard us

#Default language
lang en_US

#System time zone
timezone --utc Asia/Shanghai

#Install image url
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

#Bootloader location
bootloader --location=mbr

#Root password
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Clear partitions before disk part
clearpart --all

part / --fstype=ext4 --size=4300 --ondisk=/dev/sda
part /boot --fstype=ext4 --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --recommended --ondisk=/dev/sda
part /data --fstype=ext4 --size=5000 --ondisk=/dev/sda --encrypted

#Reboot system after install
reboot
