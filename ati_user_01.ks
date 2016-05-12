# The kickstart file will perform

# 1. a unattended installation
# 2. set user `weiwang`
# weiwang <weiwang@redhat.com>

#Authconfig set
authconfig --enableshadow --passalgo=md5

#Keyboard type set
keyboard us

#Default language set
lang en_US

#System time zone set
timezone --utc Asia/Shanghai

#Install image url set
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `static`
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

#Clear partitions before disk part
clearpart --all

#Auto partition in thinp mode
autopart --type=thinp

#Add a user
user --name=weiwang --password=qweasd --plaintext

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Text mode for installer
text

#Reboot system after install
reboot