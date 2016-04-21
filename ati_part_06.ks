# The kickstart file will perform

# 1. a unattended installation
# 2. set patition /|/boot|/swap|/data|/config|/logging
# 3. set partition label to `redhat`

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc Asia/Shanghai
liveimg --url=http://10.66.65.30/rhevh/ovirt-node-ng-image.squashfs.img

bootloader --location=mbr
rootpw --plaintext redhat
network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1

clearpart --all
part / --fstype=xfs --size=4300 --ondisk=/dev/sda
part /boot --fstype=xfs --size=4300 --ondisk=/dev/sda
part swap --fstype=swap --recommended --ondisk=/dev/sda
part /data --fstype=xfs --grow --maxsize=280000 --ondisk=/dev/sda --label=redhat
part /config --fstype=xfs --size=1024 --ondisk=/dev/sda
part /logging --fstype=xfs --size=2048 --ondisk=/dev/sda

text
reboot