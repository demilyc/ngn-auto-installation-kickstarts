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
autopart --type=thinp
# Partition clearing information
clearpart --all

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

%post --erroronfail
grubby --info=ALL
grubby --remove-args="arg1 arg2" --args="argA argB" --update-kernel /boot/kernel-name
grubby --info /boot/kernel-name
%end
