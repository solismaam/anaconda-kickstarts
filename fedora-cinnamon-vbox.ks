#
# https://docs.fedoraproject.org/f27/install-guide/appendixes/Kickstart_Syntax_Reference.html
#
# System authorization information
auth --enableshadow --passalgo=sha512
# Install OS instead of upgrade
install
# Use text mode install
text
# Use network installation
url --mirrorlist="http://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-$releasever&arch=$basearch"
# Firewall configuration
firewall --enabled --service=ssh
# Run the Setup Agent on first boot
firstboot --enable
# Keyboard layouts
keyboard --vckeymap=fi --xlayouts='fi'
# System language
lang en_US.UTF-8
# Network information
network  --bootproto=dhcp --device=link --hostname=localhost.localdomain --activate
# Root password
rootpw --lock
# System services
services --enabled="chronyd"
# System timezone
timezone Europe/Helsinki --isUtc
# X Window System configuration information
xconfig  --startxonboot
# System bootloader configuration
bootloader --location=mbr --driveorder="sda" --boot-drive=sda
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --drives=sda
# Disk partitioning information
part /boot --fstype="ext4" --ondisk=sda --size=1024
part pv.161 --fstype="lvmpv" --ondisk=sda --size=1024 --grow
volgroup fedora --pesize=4096 pv.161
logvol /     --fstype="ext4" --size=1024 --name=root --vgname=fedora --grow 
logvol swap  --fstype="swap" --size=4096 --name=swap --vgname=fedora
# Package information
%packages
@ansible-node
@base-x
@cinnamon-desktop
@fonts
@standard
ansible
%end
