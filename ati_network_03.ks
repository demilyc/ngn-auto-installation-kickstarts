# The kickstart file will perform

# 1. a unattended installation
# 2. set `bootproto` to static
# 3. set `ipv6|netmask|gateway` network config parameter


#Authconfig set
authconfig --enableshadow --passalgo=md5

#Keyboard type set
keyboard us

#Default language set
lang en_US

#System time zone set
timezone --utc Asia/Shanghai

#Install image url set
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160516.0.x86_64.liveimg.squashfs

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network configure set as IPv6 static
#network --device=ens3 --bootproto=static --ipv6=fe80::5054:ff:fe4c:3422/64 --gateway=fe80::1
network --device=enp0s25 --bootproto=static --ipv6=2001::1/64 --gateway=2001::2

#Clear partitions before disk part
clearpart --all

#Auto part disk
autopart --type=thinp

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Text mode for installer
text

#Reboot system after install
reboot
