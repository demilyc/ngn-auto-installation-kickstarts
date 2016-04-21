# The kickstart file will perform

# 1. a unattended installation
# 2. set partition as autopart with plain type

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1
clearpart --all
autopart --nolvm
reboot