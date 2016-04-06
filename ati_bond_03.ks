# The kickstart file will perform

# 1. a unattended installation
# 2. set password for user `root` to redhat
# 3. set timezone to `Asia/Shanghai`
# 4. ...

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.10.22:8090/rhevh/ngn/latest/ovirt-node-ng-image.squashfs.img
bootloader --location=mbr
rootpw --plaintext redhat
user --name=admin --password=4DHc2Jl0D05xk
network --device=bond02 --bondslaves=ens3,ens4 --bondopts=mode=balance-xor,miimon=10000 --bootproto=dhcp
clearpart --all
autopart --type=thinp
text
%packages
@X Window System
@GNOME Desktop Environment
@Graphical Internet
@Sound and Video
%end
%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot
