# set static ip
# /etc/network/interfaces.d/enp4s0
# The primary network interface
allow-hotplug enp4s0
iface enp4s0 inet static
address 192.168.0.201
        netmask 255.255.255.0
        gateway 192.168.0.1
        # dns-* options are implemented by the resolvconf package, if installed
        dns-nameservers 1.1.1.1 1.0.0.1
        dns-search proxm.abi.net
        
# /etc/hosts
127.0.0.1
192.168.0.201  proxm.abi.net  proxm
