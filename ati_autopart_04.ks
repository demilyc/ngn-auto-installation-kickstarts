# The kickstart file will perform

# 1. a unattended installation
# 2. set type to `btrfs`
# 3. Check point: #df -Th, the output of Type for partitions are btrfs

#Authconfig
authconfig --enableshadow --passalgo=sha512

#Keyboard type
keyboard us

#Default language
lang en_US

#System time zone
timezone --utc Asia/Shanghai

#Install image url
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160518.0.x86_64.liveimg.squashfs

#Bootloader location
bootloader --location=mbr

#Root password
rootpw --plaintext redhat

#Network set `static`
network --device=enp0s25 --bootproto=static --ip=10.66.11.209 --netmask=255.255.252.0 --gateway=10.66.11.254

#Clear partitions before disk part
clearpart --all --initlabel

#Automatic partition set btrfs type
autopart --type=btrfs

#text mode
text

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Reboot system after install
reboot