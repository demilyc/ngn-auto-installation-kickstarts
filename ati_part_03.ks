# The kickstart file will perform

# 1. a unattended installation
# 2. set patition /|/boot|/swap|/data|/config|/logging
# 3. set maxsize to 5120Mb

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

#Clear partitions before disk part
clearpart --all

#Manual partition /, /boot, swap, /data, /config, /logging on /dev/sda
part / --fstype=ext4 --size=4300 --ondisk=/dev/sda
part /boot --fstype=ext4 --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --recommended --ondisk=/dev/sda
part /data --fstype=ext4 --grow --maxsize=5120 --ondisk=/dev/sda
part /config --fstype=ext4 --size=5 --ondisk=/dev/sda
part /logging --fstype=ext4 --size=2048

#Text mode for installer
text

#Reboot system after install
reboot