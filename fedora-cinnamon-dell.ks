%include fedora-cinnamon-base.ks
network --bootproto=dhcp --device=eno1 --ipv6=auto --activate
network --bootproto=dhcp --device=wlp3s0 --ipv6=auto --activate
network  --bootproto=dhcp --hostname=dell
