# The kickstart file will perform

# 1. a unattended installation
# 2. set volgroup name to `testgroup`
# 3. set logvol /|/swap|/data
# 4. set fstype to xfs|ext4

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part pv.01 --size=10000 --ondisk=/dev/sda
part pv.02 --size=15000 --ondisk=/dev/sdb
part /boot --fstype=xfs --size=4300 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02

logvol / --vgname=testgroup --size=8900 --name=root --fstype=ext4
logvol swap --vgname=testgroup --recommended --name=swap --fstype=swap
logvol /data --vgname=testgroup --size=10000 --name=data --fstype=xfs

reboot