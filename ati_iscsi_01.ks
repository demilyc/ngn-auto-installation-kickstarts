#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img"
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=md5

# System bootloader configuration
bootloader --location=mbr
iscsiname iqn.2000-04.com.qlogic:qle4060c.gs40841a31566.1
iscsi --target=iqn.1986-03.com.ibm:2145.clusterv3700.node2 --ipaddr=10.73.64.13
autopart --type=thinp
# Partition clearing information
clearpart --all

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
