# The kickstart file will perform

# 1. a unattended installation
# 2. set volgroup name to `testgroup`
# 3. set logvol /|/swap|/data

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160518.0.x86_64.liveimg.squashfs

bootloader --location=mbr
rootpw --plaintext redhat
network --device=enp0s25 --bootproto=static --ip=10.66.11.209 --netmask=255.255.252.0 --gateway=10.66.11.254

clearpart --all
part pv.01 --size=100000 --ondisk=/dev/sda
part pv.02 --size=150000 --ondisk=/dev/sda
part /boot --size=4300 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02

logvol / --vgname=testgroup --size=43000 --name=root
logvol swap --vgname=testgroup --size=1024 --name=swap
logvol /data --vgname=testgroup --size=43000 --name=data

%pre --log=/tmp/pre-install.log
echo "imgbase create on storage lvm"
%end

%post --nochroot --log=/mnt/sysimage/root/post-install.log
cp -v /tmp/pre-install.log /mnt/sysimage/root
%end

text
reboot