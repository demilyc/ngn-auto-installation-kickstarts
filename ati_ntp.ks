# The kickstart file will perform

# 1. a unattended installation
# 2. set `ntpservers` to "10.66.11.225,10.66.127.17"


authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai --ntpservers=10.66.11.225,10.66.127.17
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=dhcp
clearpart --all
autopart --type=thinp
text
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot