# The kickstart file will perform

# 1. a unattended installation
# 2. set boot partition to local disk
# 3. set /|swap to FC disk 1
# 3. set /home to FC disk 2
# 4. using machine `dell-per510-01`

authconfig --enableshadow --passalgo=md5
keyboard us
lang en_US
timezone --utc {timezone_utc}
liveimg --url={liveimg}

bootloader --location=mbr
rootpw --plaintext {rootpassword}
#network --device=ens3 --bootproto=static --ip=192.168.10.3 --netmask=255.255.255.0 --gateway=192.168.10.1
network --device=ens3 --bootproto=dhcp

clearpart --all

# xfs instead of ext4 - ycui modified on auto branch.
part / --fstype=xfs --size=43000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /boot --fstype=xfs --size=43000 --ondisk=/dev/disk/by-id/scsi-36782bcb03cdfa200174636ff055184dc
part swap --fstype=swap --size=6000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /home --fstype=xfs --size=80504 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000023


text

%post --nochroot
curl -s http://{srv_ip}:{srv_port}/done/{bkr_name}
%end

reboot