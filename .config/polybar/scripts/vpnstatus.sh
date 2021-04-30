#!/bin/sh

 VPNStatus=$(pgrep openconnect | awk '/[a-z0-9]/{print "yes"}')

if [[ $VPNStatus == "yes" ]]; then
    echo "賓"
else
    echo "VPN Not Connected !"
fi
