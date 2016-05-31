#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-4.0-20160526.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=dhcp --device=ens3
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc --ntpservers=10.66.11.225,10.66.127.17
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
