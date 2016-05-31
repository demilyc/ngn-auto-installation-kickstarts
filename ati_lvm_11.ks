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
auth --enableshadow --passalgo=md5
# Use text mode install
text

# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all
# Disk partitioning information
part pv.01 --ondisk=/dev/sda --size=100000
part pv.02 --ondisk=/dev/sda --size=150000
part /boot --ondisk=/dev/sda --size=4300
volgroup testgroup pv.01 pv.02
logvol /  --size=43000 --name=root --vgname=testgroup
logvol swap  --size=1024 --name=swap --vgname=testgroup
logvol /data  --size=43000 --name=data --vgname=testgroup

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 1G
%end
