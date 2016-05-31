#version=DEVEL
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --plaintext redhat
# System language
lang en_US
# Use live disk image installation
liveimg --url="http://10.66.65.30/rhevh/rhev-hypervisor7-ng-3.6-20160426.0.x86_64.liveimg.squashfs"
# Network information
network  --bootproto=dhcp --device=ens3
# Reboot after installation
reboot
# System timezone
timezone Asia/Shanghai --isUtc
# System authorization information
auth --enableshadow --passalgo=md5

# System bootloader configuration
bootloader --location=mbr
<<<<<<< HEAD

#Root password set
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all --initlabel --disklabel=gpt

#Create biosboot
#part biosboot --size=1 --fstype=biosboot --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part /boot --fstype=xfs --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part /boot/efi --fstype=efi --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
#part / --fstype=ext4 --size=1 --grow --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931

autopart --type=thinp

#Reboot system after install
reboot
=======
autopart --type=thinp
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel --disklabel=gpt
>>>>>>> 96b9b699d4ea48cd45336a273e35f09979955c40
