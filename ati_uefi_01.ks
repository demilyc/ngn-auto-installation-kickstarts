# The kickstart file will perform

# 1. a unattended installation
# 2. set UEFI mode in machine
# 3. set /boot|/boot/efi
# 4. using machine `dell-per210-01`

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

zerombr

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all --initlable --disklabel=gpt

#Create biosboot
#part biosboot --size=1 --fstype=biosboot --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part /boot --fstype=xfs --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part /boot/efi --fstype=efi --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part / --fstype=ext4 --size=1 --grow --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931

autopart --type=thinp

#Reboot system after install
reboot