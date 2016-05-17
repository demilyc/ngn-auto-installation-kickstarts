# The kickstart file will perform

# 1. a unattended installation
# 2. set network device is `bond00` in mode `mode=broadcast`
# weiwang <weiwang@redhat.com>

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
network --device=bond03 --bondslaves=em1,p4p2 --bondopts=mode=broadcast,miimon=200 --bootproto=dhcp
clearpart --all
autopart --type=thinp
text
user --name=node --password=123qweP --plaintext
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot