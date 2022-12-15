function bluetooth_toggle
if bluetoothctl show | rg "PowerState: on"
bluetoothctl power off
else
bluetoothctl power on
end
end
