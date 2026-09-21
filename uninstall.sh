#!/bin/sh
# gl-switch-podkop uninstaller

set -e

uci set switch-button.@main[0].func='none'
uci commit switch-button
rm -f /etc/gl-switch.d/podkop.sh

echo "gl-switch-podkop removed, the switch is back to 'none'."
echo "Note: any IP(s) it already added to podkop's fully_routed_ips list are"
echo "left in place. Remove them manually in LuCI (Podkop -> Sections) or with:"
echo "  uci show podkop | grep fully_routed_ips"
echo "  uci del_list podkop.<section>.fully_routed_ips='<ip>'"
echo "  uci commit podkop && /etc/init.d/podkop reload"
