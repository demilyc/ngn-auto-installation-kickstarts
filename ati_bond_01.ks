# The kickstart file will perform

# 1. a unattended installation
# 2. set network device is `bond00` in mode `balance-rr`
# 3. use dell-op790-01

authconfig --enableshadow --passalgo=sha512
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/ovirt-node/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
network --device=bond00 --bondslaves=em1,p4p2 --bondopts=mode=balance-rr,miimon=100 --bootproto=dhcp --onboot=yes
user --name=node --password=123qweP --plaintext
clearpart --all
autopart --type=thinp
text
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot
