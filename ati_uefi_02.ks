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
# Use text mode install
text

# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all
# Disk partitioning information
part biosboot --fstype="biosboot" --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931 --size=1
part /boot --fstype="xfs" --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931 --size=2000
part /boot/efi --fstype="efi" --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931 --size=2000
part pv.01 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931 --size=10000
part pv.02 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931 --size=15000
volgroup testgroup pv.01 pv.02
logvol none  --size=20000 --thinpool --name=ngn_pool --vgname=testgroup
logvol /  --fstype="xfs" --size=6000 --thin --poolname=ngn_pool --name=root --vgname=testgroup
logvol swap  --fstype="swap" --size=2048 --thin --poolname=ngn_pool --name=swap --vgname=testgroup
logvol /home  --fstype="xfs" --size=9000 --thin --poolname=ngn_pool --name=home --vgname=testgroup

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end
