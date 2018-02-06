# To create an alpine base image:

Spin up a new VM:
 - 512MB RAW Disk image (hence called alpine.img)
 - Virtio Network bridge
 - ISO of Alpine Virtual ed. attached

Inside the VM:
 - Add the following to /etc/network/interfaces:


    auto lo
    iface lo inet loopback

    auto eth0
    iface eth0 inet dhcp
      hostname alpine

 - `/etc/init.d/networking restart`
 - Run `setup-alpine`:
   - gb
   - gb
   - alpine
   - eth0
   - dhcp
   - no
   - [Enter twice]
   - UTC
   - none
   - 1
   - openssh
   - busybox
   - sda
   - sys
   - y


 - `passwd -d root`
 - `poweroff`

Make sure the VM is stopped.

Run `virt-sysprep -a alpine.img`

Run `xz -k -verbose -T4 --best --block-size=16777216 alpine.img`

Create the index file as below. <> Shows commands to generate the required data. Replace version as needed.

  ```
  [alpine-37]
  name=Alpine 3.7
  osinfo=alpine
  arch=x86_64
  file=alpine.img.xz
  checksum=<sha512sum alpine.img.xz>
  format=raw
  size=<du -s alpine.img>
  compressed_size=<du -s alpine.img.xz>
  expand=/dev/sda3
  ```

Sign the index file:
 `gpg --clearsign --armor index`


Upload the generated `index.asc` and `alpine.img.xz` files to a web server.
