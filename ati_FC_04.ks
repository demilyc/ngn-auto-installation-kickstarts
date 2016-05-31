#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160429.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=static --device=ens3 --gateway=192.168.10.1 --ip=192.168.10.3 --netmask=255.255.255.0
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=md5
# Use text mode install
text

# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all
# Disk partitioning information
part / --fstype="ext4" --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022 --size=43000
part /boot --fstype="ext4" --ondisk=/dev/disk/by-id/scsi-36782bcb03cdfa2001ebc7e930f1ca244 --size=43000
part swap --fstype="swap" --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022 --size=6000
part /home --fstype="ext4" --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000023 --size=80504
