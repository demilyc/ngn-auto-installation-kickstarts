#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160516.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=dhcp --device=em2
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
part pv.01 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022 --size=100000
part pv.02 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022 --size=50000
part /boot --ondisk=/dev/disk/by-id/scsi-36782bcb03cdfa2001ebc7e930f1ca244 --size=10000
volgroup testgroup pv.01 pv.02
logvol none  --size=120000 --thinpool --name=ngn_pool --vgname=testgroup
logvol /  --fstype="ext3" --size=30000 --thin --poolname=ngn_pool --name=root --vgname=testgroup
logvol swap  --fstype="swap" --size=2048 --thin --poolname=ngn_pool --name=swap --vgname=testgroup
logvol /home  --fstype="xfs" --size=80000 --thin --poolname=ngn_pool --name=home --vgname=testgroup

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
