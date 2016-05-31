#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=static --device=eth0 --gateway=192.168.10.1 --ip=192.168.10.3 --netmask=255.255.255.0
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=md5
# Use text mode install
text
# SELinux configuration
selinux --enforcing

# System bootloader configuration
bootloader --location=mbr --boot-drive=/dev/sda
# Partition clearing information
clearpart --all
# Disk partitioning information
part pv.01 --ondisk=/dev/sda --size=10000
part pv.02 --ondisk=/dev/sda --size=15000
part /boot --fstype="xfs" --ondisk=/dev/sda --size=4300
volgroup testgroup pv.01 pv.02
logvol /  --fstype="ext4" --size=8900 --name=root --vgname=testgroup
logvol swap  --fstype="swap" --recommended --name=swap --vgname=testgroup
logvol /data  --fstype="xfs" --size=10000 --name=data --vgname=testgroup
