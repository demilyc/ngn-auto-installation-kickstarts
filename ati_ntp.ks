# The kickstart file will perform

# 1. a unattended installation
# 2. set `ntpservers` to "10.66.11.225,10.66.127.17"


#Authconfig
authconfig --enableshadow --passalgo=md5

#Keyboard type
keyboard us

#Default language
lang en_US

#System time zone, using ntpserver
timezone --utc Asia/Shanghai --ntpservers=10.66.11.225,10.66.127.17

#Install image url set
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-4.0-20160526.0.x86_64.liveimg.squashfs

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all

#Auto part disk to `thinp`
autopart --type=thinp

#text mode
text

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

#Reboot system after install
reboot