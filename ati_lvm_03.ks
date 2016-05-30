# The kickstart file will perform

# 1. a unattended installation
# 2. set volgroup name to `testgroup`
# 3. set logvol /|/swap|/data
# 4. set grow enabled
# 5. set maxsize to `12000`

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-4.0-20160527.0.x86_64.liveimg.squashfs

bootloader --location=mbr
rootpw --plaintext redhat
network --device=enp0s25 --bootproto=static --ip=10.66.11.209 --netmask=255.255.252.0 --gateway=10.66.11.254

clearpart --all
part pv.01 --size=100000 --ondisk=/dev/sda
part pv.02 --size=150000 --ondisk=/dev/sda
part /boot --size=4300 --ondisk=/dev/sda
volgroup testgroup pv.01 pv.02

logvol / --vgname=testgroup --size=89000 --name=root
logvol swap --vgname=testgroup --recommended --name=swap
logvol /data --vgname=testgroup --size=100000 --name=data --grow --maxsize=12000

reboot