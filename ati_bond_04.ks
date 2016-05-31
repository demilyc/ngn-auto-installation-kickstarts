#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img"
user --name=node --password=123qweP
# Network information
network  --bootproto=dhcp --device=bond03 --bondslaves=em1,p4p2 --bondopts=mode=broadcast,miimon=200
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
