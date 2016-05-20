# The kickstart file will perform

# 1. a unattended installation
# 2. set network to vlan `50`
# 3. use dell-per515-02

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

#Root password
rootpw --plaintext redhat

#Network configure set as vlan to `50`
network --device=p2p1 --vlanid=50 --bootproto=dhcp --onboot=yes

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
