# The kickstart file will perform

# 1. a unattended installation
# 2. set partition as autopart with thinp type

#Authconfig
authconfig --enableshadow --passalgo=md5

#Keyboard type
keyboard us

#Default language
lang en_US

#System time zone
timezone --utc Asia/Shanghai

#Install image url
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-4.0-20160527.0.x86_64.liveimg.squashfs

#Bootloader location
bootloader --location=mbr

#Root password
rootpw --plaintext redhat

#Network set `static`
network --device=enp0s25 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all --initlabel
zerombr

#Automatic partition set thinp type
reqpart --add-boot

part pv.01 --size=100000 --ondisk=/dev/sda
part pv.02 --size=150000 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02
logvol none --vgname=testgroup --thinpool --name=ngn_pool --size=200000
logvol / --vgname=testgroup --thin --size=150000 --fstype=xfs --name=root --poolname=ngn_pool

#text mode
text

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Reboot system after install
reboot

http://10.66.65.30/rhevh/wangwei.ks