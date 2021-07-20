#!/bin/bash

fuboTV=$(i3-msg -t get_tree | grep -i -c 'fubo.tv')
nordVPN_name=$(nmcli -t -f NAME c show | awk -e '/^us.*nordvpn/{print $0; exit}')
nordVPN_status=$(nmcli -t -f NAME c show --active | awk '/nordvpn/{print "active"}')

if [[ $fuboTV == 0 ]]; then
  
    # Run xrandr for enable my Samsung TV screen
    xrandr --output HDMI-0 --primary --mode 1680x1050 --pos 0x768 --rotate normal --output DVI-0 --off --output VGA-0 --mode 1360x768 --pos 160x0 --rotate normal

    if [[ $nordVPN_status != "active" ]]; then
        # Run NordVPN
        nmcli connection up $nordVPN_name
    fi

    # Run Brave and open Fubo.tv website
    i3-msg exec 'brave --new-window --app=https://www.fubo.tv/channels' && sleep 1 && i3-msg '[instance="www.fubo.tv__channels"]'  move to output VGA-0 && i3-msg '[instance="www.fubo.tv__channels"]' fullscreen enable

fi


