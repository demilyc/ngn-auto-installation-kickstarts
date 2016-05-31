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
part / --fstype="ext4" --ondisk=/dev/sda --size=4300
part /boot --fstype="ext4" --ondisk=/dev/sda --size=4300
part swap --fstype="swap" --ondisk=/dev/sda --recommended
part /data --fstype="ext4" --grow --maxsize=280000 --ondisk=/dev/sda --label=redhat
part /config --fstype="ext4" --ondisk=/dev/sda --size=1024
part /logging --fstype="ext4" --ondisk=/dev/sda --size=2048
