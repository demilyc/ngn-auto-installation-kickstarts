# The kickstart file will perform

# 1. a unattended installation
# 2. set partition as autopart with thinp type
# 3. using grubby tool to add boot kernel arguments

#Authconfig set
authconfig --enableshadow --passalgo=md5

#Keyboard type set
keyboard us

#Default language set
lang en_US

#System time zone set
timezone --utc Asia/Shanghai

#Install image url set
liveimg --url=http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160518.0.x86_64.liveimg.squashfs

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `static`
network --device=enp0s25 --bootproto=static --ip=10.66.11.209 --netmask=255.255.252.0 --gateway=10.66.11.254

#Clear partitions before disk part
clearpart --all

#Automatic partition set thinp type
autopart --type=thinp

#text mode
text

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

%post --erroronfail 
grubby --info=ALL
grubby --remove-args="arg1 arg2" --args="argA argB" --update-kernel /boot/kernel-name
grubby --info /boot/kernel-name
%end

#Reboot system after install
reboot