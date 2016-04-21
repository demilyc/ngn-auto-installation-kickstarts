# The kickstart file will perform

#1. a unattended installation
#2. set iscsiname to `initiator iqn`
#3. set iscsi ipaddr to `target IP`
#4. set iscsi port to `portnumber`
#5. set iscsi target to `target name`
#6. singlepath (dell-pet105-01)

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai

liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

bootloader --location=mbr
rootpw --plaintext redhat
#network --device=ens3 --bootproto=dhcp

iscsiname iqn.2000-04.com.qlogic:qle4060c.gs40841a31566.1
iscsi --ipaddr=10.73.64.13 --port=3260 --target=iqn.1986-03.com.ibm:2145.clusterv3700.node2 --iface=

clearpart --all
autopart --type=thinp

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
reboot