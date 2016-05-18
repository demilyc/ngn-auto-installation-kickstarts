# The kickstart file will perform

# 1. a unattended installation
# 2. set boot partition to local disk
# 3. set /|swap|home to FC disk
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
part / --fstype=ext4 --size=43000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /boot --fstype=ext4 --size=43000 --ondisk=/dev/disk/by-id/scsi-36782bcb03cdfa2001ebc7e930f1ca244
part swap --fstype=swap --size=6000 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022
part /home --fstype=ext4 --size=140504 --ondisk=/dev/disk/by-id/scsi-36005076300810b3e0000000000000022


text

%post --nochroot
curl -s http://{srv_ip}:{srv_port}/done/{bkr_name}
%end

reboot
