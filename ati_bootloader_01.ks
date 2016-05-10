# The kickstart file will perform

# 1. a unattended installation
# 2. set bootloader saved in 'mbr'

#Authconfig set
authconfig --enableshadow --passalgo=md5

#Keyboard type set
keyboard us

#Default language set
lang en_US

#System time zone set
timezone --utc Asia/Shanghai

#Instal image url set
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `static`
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Clear partitions before disk part
clearpart --all

#Automatic partition
autopart --type=thinp

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Reboot system after install
reboot