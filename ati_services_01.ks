# The kickstart file will perform

# 1. a unattended installation
# 2. set volgroup name to `testgroup`
# 3. set logvol /|/swap|/data
# 4. set sshd enabled

#Authconfig set
authconfig --enableshadow --passalgo=md5

#Keyboard type set
keyboard us

#Default language set
lang en_US

#System time zone set
timezone --utc Asia/Shanghai

#Install image url set
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `static`
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Enable sshd
services --enabled=sshd

#Clear partitions before disk part
clearpart --all

#Lvm
part pv.01 --size=10000 --ondisk=/dev/sda
part pv.02 --size=15000 --ondisk=/dev/sda
part /boot --fstype=xfs --size=4300 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02

logvol / --vgname=testgroup --size=8900 --name=root --fstype=ext4
logvol swap --vgname=testgroup --recommended --name=swap --fstype=swap
logvol /data --vgname=testgroup --size=10000 --name=data --fstype=xfs

#text mode
text

#Reboot system after install
reboot