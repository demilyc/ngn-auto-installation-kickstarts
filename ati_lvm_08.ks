# The kickstart file will perform

# 1. a unattended installation
# 2. set volgroup name to `testgroup`
# 3. set logvol / with percent size
# 4. set logvol to thin pool

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part pv.01 --size=10000 --ondisk=/dev/sda
part pv.02 --size=15000 --ondisk=/dev/sda
part /boot --size=4300 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02

logvol / --vgname=testgroup --percent=20 --name=root --grow
logvol swap --vgname=testgroup --recommended --name=swap
logvol none --vgname=testgroup --thinpool --name=pool --size=6000

reboot