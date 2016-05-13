# The kickstart file will perform

# 1. a unattended installation
# 2. set bootproto to `dhcp`


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

#Network set `dhcp`
network --device=ens3 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all

#Auto part disk
autopart --type=plain

#Reboot system after install
reboot