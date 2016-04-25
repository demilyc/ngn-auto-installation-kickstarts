# The kickstart file will perform

# 1. a unattended installation
# 2. set network device is `bond00` in mode `mode=balance-xor`
# weiwang <weiwang@redhat.com>

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
network --device=bond02 --bondslaves=ens3,ens4 --bondopts=mode=balance-xor,miimon=10000 --bootproto=dhcp
clearpart --all
autopart --type=thinp
text
user --name=node --password=123qweP --plaintext
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot