# The kickstart file will perform

# 1. a unattended installation
# 2. set type to `btrfs`
# 3. Check point: #df -Th, the output of Type for partitions are btrfs

#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160518.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=static --device=enp0s25 --gateway=10.66.11.254 --ip=10.66.11.209 --netmask=255.255.252.0
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=sha512
# Use text mode install
text

# System bootloader configuration
bootloader --location=mbr
autopart --type=btrfs
# Partition clearing information
clearpart --all --initlabel

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

