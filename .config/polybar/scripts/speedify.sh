#!/bin/bash

# First Of All run these commands to set configuration
# speedify_cli headercompression on
# speedify_cli encryption on 
# speedify_cli esni on 
# speedify_cli mode speed 
# speedify_cli streaming domains add youtube.com
# speedify_cli streamingbypass domains add downloadly.ir
# speedify_cli jumbo on
# speedify_cli packetaggr on 
# speedify_cli transport udp 
# speedify_cli dns 1.1.1.1
# speedify_cli startupconnect on

state=$(speedify_cli state | jq -r .state)
server="#no-oslo-2"

speedify_print() {
  if [ "$state" == "CONNECTED" ] ; then
    currentServer=$(speedify_cli show currentserver | jq -r .friendlyName)
    echo "   $currentServer"
  elif [ "$state" == "LOGGED_IN" ] ; then
    echo "   NOT CONNECTED"
  fi
}

speedify_toggle() {
  if [ "$state" == "CONNECTED" ] ; then
    speedify_cli disconnect
  elif [ "$state" == "LOGGED_IN" ] ; then
    echo "CONNECTING..."
    speedify_cli connect last
  fi
}

case "$1" in
    --toggle)
        speedify_toggle
        ;;
    *)
        speedify_print
        ;;
esac

