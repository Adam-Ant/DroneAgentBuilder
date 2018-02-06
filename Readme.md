# Alpine Drone Agent builder

Create a VM for setting a drone build agent.

Put alpinelinux.\* into /etc/xdg/virt-builder/repos.d/

Put your credentials into dronecfg, then
Run with `virt-builder --size 10G --format qcow2 --commands-from-file builder-commands`
