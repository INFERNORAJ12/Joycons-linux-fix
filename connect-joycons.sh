#!/bin/bash

JOY_R="48:F1:EB:B3:6B:89"
JOY_L="48:F1:EB:B3:C7:4C"

# Open GNOME Bluetooth settings (this automatically starts discovery)
gnome-control-center bluetooth &

# Status flags to track which controllers have been found
R_CONNECTED=0
L_CONNECTED=0

echo "Scanning... Put your Joy-Cons in pairing mode."

# Keep looping until both controllers are discovered and connected
while [[ $R_CONNECTED -eq 0 || $L_CONNECTED -eq 0 ]]; do
    
    # Check if Right Joy-Con is found by the system
    if [[ $R_CONNECTED -eq 0 ]] && bluetoothctl devices | grep -q -i "$JOY_R"; then
        echo "Discovered Right Joy-Con! Connecting..."
        bluetoothctl pair "$JOY_R"
        sleep 1
        bluetoothctl connect "$JOY_R"
        bluetoothctl trust "$JOY_R"
        R_CONNECTED=1
    fi

    # Check if Left Joy-Con is found by the system
    if [[ $L_CONNECTED -eq 0 ]] && bluetoothctl devices | grep -q -i "$JOY_L"; then
        echo "Discovered Left Joy-Con! Connecting..."
        bluetoothctl pair "$JOY_L"
        sleep 1
        bluetoothctl connect "$JOY_L"
        bluetoothctl trust "$JOY_L"
        L_CONNECTED=1
    fi

    # Wait 2 seconds before checking again to avoid high CPU usage
    sleep 2
done

echo "Both Joy-Cons successfully paired and connected!"

# Wait a brief moment to ensure connections stabilize
sleep 1

# Close GNOME Bluetooth settings
pkill -f "gnome-control-center bluetooth"
