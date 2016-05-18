# The kickstart file will perform

# 1. a unattended installation
# 2. set boot partition to local disk
# 3. set /|swap to FC disk 1
# 3. set /home to FC disk 2
# 4. using machine `dell-per510-01`

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160429.0.x86_64.liveimg.squashfs

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part / --fstype=ext4 --size=43000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /boot --fstype=ext4 --size=43000 --ondisk=/dev/disk/by-id/scsi-36782bcb03cdfa2001ebc7e930f1ca244
part swap --fstype=swap --size=6000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /home --fstype=ext4 --size=80504 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000023


text
reboot