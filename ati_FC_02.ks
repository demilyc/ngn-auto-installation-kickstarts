# The kickstart file will perform

# 1. a unattended installation
# 2. set /|swap|home|boot to FC disk in lvm
# 3. using machine `dell-per510-01`

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160429.0.x86_64.liveimg.squashfs

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part pv.01 --size=100000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part pv.02 --size=50000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /boot --size=10000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
volgroup testgroup pv.01 pv.02

logvol none --vgname=testgroup --thinpool --name=ngn_pool --size=120000
logvol / --vgname=testgroup --thin --size=30000 --fstype=ext3 --name=root --poolname=ngn_pool
logvol swap --vgname=testgroup --thin --size=2048 --name=swap --fstype=swap --poolname=ngn_pool
logvol /home --vgname=testgroup --thin --size=80000 --fstype=xfs --name=home --poolname=ngn_pool

text
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot