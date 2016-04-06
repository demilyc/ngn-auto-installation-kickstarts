# The kickstart file will perform

# 1. a unattended installation
# 2. set password for user `root` to redhat
# 3. set timezone to `Asia/Harbin`
# 4. ...

liveimg --url=http://10.66.10.22:8090/rhevh/ngn/latest/ovirt-node-ng-image.squashfs.img

clearpart --all

autopart --type=thinp

rootpw --plaintext redhat

timezone --utc Asia/Harbin

zerombr

text

reboot

%post --erroronfail
imgbase layout --init
imgbase --experimental volume --create /var 4G
%end