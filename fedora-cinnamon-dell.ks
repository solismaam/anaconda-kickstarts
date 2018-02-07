#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use text mode install
text
# Use network installation
url --mirrorlist="http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name=fedora-updates --mirrorlist="http://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch"
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=fi --xlayouts='fi'
# System language
lang en_US.UTF-8
# Root password
rootpw --lock
# System services
services --enabled="chronyd"
# System timezone
timezone Europe/Helsinki --isUtc
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --location=mbr --boot-drive=sda
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Disk partitioning information
part /boot  --fstype="ext4"  --ondisk=sda --size=1024
part pv.265 --fstype="lvmpv" --ondisk=sda --size=1024 --grow
volgroup fedora --pesize=4096 pv.265
logvol /     --fstype="ext4" --size=25600 --name=root --vgname=fedora
logvol /home --fstype="ext4" --size=25600 --name=home --vgname=fedora
logvol /var  --fstype="ext4" --size=1024  --name=var  --vgname=fedora --grow
logvol swap  --fstype="swap" --size=8196  --name=swap --vgname=fedora

%packages
@^cinnamon-desktop-environment
@ansible-node
ansible
git
vim
%end
