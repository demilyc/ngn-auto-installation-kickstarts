# The kickstart file will perform

# 1. a unattended installation
# 2. two disk sda and adb, sda(lvm) for rhevh installation; sdb(plain) for swap partition
# 3. set volgroup name to `testgroup`
# 4. set thinp for storage 

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
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Clear partitions before disk part
clearpart --all

#clear mbr
zerombr

#partition
part pv.01 --size=10000 --ondisk=/dev/sda
part pv.02 --size=15000 --ondisk=/dev/sda
part /boot --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --recommended --ondisk=/dev/sdb
volgroup testgroup pv.01 pv.02

logvol none --vgname=testgroup --thinpool --name=ngn_pool --size=20000
logvol / --vgname=testgroup --thin --size=6000 --fstype=ext3 --name=root --poolname=ngn_pool
logvol /home --vgname=testgroup --thin --size=9000 --fstype=xfs --name=home --poolname=ngn_pool

#text mode
text

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Reboot system after install
reboot