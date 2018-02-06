#!/bin/sh

source /etc/os-release

cat << EOF > /etc/motd

$PRETTY_NAME ($VERSION_ID) Docker Host

Built as a CI runner for Docker-based CI platforms
    such as Drone-CI https://github.com/drone/drone

See the Alpine Wiki for how-to guides and
general information about administrating
Alpine systems and development.
See <http://wiki.alpinelinux.org>

EOF

