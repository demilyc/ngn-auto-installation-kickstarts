#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img"
# Firewall configuration
firewall --disabled
# Network information
network  --bootproto=static --device=ens3 --gateway=192.168.10.1 --ip=192.168.10.3 --netmask=255.255.255.0
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=md5

ignoredisk --drives=/dev/sdb
# System bootloader configuration
bootloader --location=mbr
autopart --type=thinp
# Partition clearing information
clearpart --all

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
