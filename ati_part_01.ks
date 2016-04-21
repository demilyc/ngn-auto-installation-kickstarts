# The kickstart file will perform

# 1. a unattended installation
# 2. set patition /|/boot|/swap|/data|/config|/logging

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part / --fstype=ext4 --size=4300 --ondisk=/dev/sda
part /boot --fstype=ext4 --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --size=3832 --ondisk=/dev/sda
part /data --fstype=ext4 --size=290504 --ondisk=/dev/sda
part /config --fstype=ext4 --size=5 --ondisk=/dev/sda
part /logging --fstype=ext4 --size=2048

text
reboot