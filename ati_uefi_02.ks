# The kickstart file will perform

# 1. a unattended installation
# 2. set UEFI mode in machine
# 3. set /boot|/boot/efi in thinp mode
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

#Bootloader location set
bootloader --location=mbr

#Root password set
rootpw --plaintext redhat

#Network set `dhcp`
network --device=ens3 --bootproto=dhcp

#Clear partitions before disk part
clearpart --all

#Create biosboot
part biosboot --size=1 --fstype=biosboot --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
part /boot --fstype=xfs --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
part /boot/efi --fstype=efi --size=2000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931


part pv.01 --size=10000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
part pv.02 --size=15000 --ondisk=/dev/disk/by-id/ata-TEAC_DVD-ROM_DV-28SW_11043021053931
volgroup testgroup pv.01 pv.02

logvol none --vgname=testgroup --thinpool --name=ngn_pool --size=20000
logvol / --vgname=testgroup --thin --size=6000 --fstype=xfs --name=root --poolname=ngn_pool
logvol swap --vgname=testgroup --thin --size=2048 --name=swap --fstype=swap --poolname=ngn_pool
logvol /home --vgname=testgroup --thin --size=9000 --fstype=xfs --name=home --poolname=ngn_pool

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end

text

#Reboot system after install
reboot