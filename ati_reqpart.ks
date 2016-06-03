# The kickstart file will perform

# 1. a unattended installation
# 2. set partition as autopart with thinp type

#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-4.0-20160527.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=dhcp --device=enp0s25
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
reqpart --add-boot
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part pv.01 --ondisk=/dev/sda --size=100000
part pv.02 --ondisk=/dev/sda --size=150000
volgroup testgroup pv.01 pv.02
logvol none  --size=200000 --thinpool --name=ngn_pool --vgname=testgroup
logvol /  --fstype="xfs" --size=150000 --thin --poolname=ngn_pool --name=root --vgname=testgroup

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end