# The kickstart file will perform

# 1. a unattended installation
# 2. set patition /|/boot|/swap|/data|/config|/logging
# 3. set onpart to `redhat`
# 4. set noformat enabled

#Authconfig
authconfig --enableshadow --passalgo=md5

#Keyboard type
keyboard us

#Default language
lang en_US

#System time zone
timezone --utc Asia/Shanghai

#Install image url
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs

#Bootloader location
bootloader --location=mbr

#Root password
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Clear partitions before disk part
clearpart --list=/dev/sda1,/dev/sda2,/dev/sda3,/dev/sda5,/dev/sda6

part / --fstype=xfs --size=4300 --ondisk=/dev/sda
part /boot --fstype=xfs --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --recommended --ondisk=/dev/sda
part /data --fstype=xfs --size=18000 --ondisk=/dev/sda --onpart=LABEL=redhat --noformat

#text mode
text

#Reboot system after install
reboot