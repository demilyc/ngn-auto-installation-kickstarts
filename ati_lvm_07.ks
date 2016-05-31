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

# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all
# Disk partitioning information
part pv.01 --ondisk=/dev/sda --size=10000
part pv.02 --ondisk=/dev/sda --size=15000
part /boot --ondisk=/dev/sda --size=4300
volgroup testgroup pv.01 pv.02
logvol /  --grow --percent=20 --name=root --vgname=testgroup
logvol swap  --recommended --name=swap --vgname=testgroup
logvol /home  --grow --percent=80 --name=home --vgname=testgroup

%pre --logfile /tmp/pre-install.log
echo "imgbase create on storage lvm"
%end

%post --nochroot --logfile /mnt/sysimage/root/post-install.log
cp -v /tmp/pre-install.log /mnt/sysimage/root
%end
