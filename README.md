# Joycons Linux Fix 🎮🐧

A straightforward shell script workaround for a known Bluetooth bug on Fedora GNOME, where Nintendo Switch Joy-Cons successfully connect via the graphical UI but fail to connect properly when using standard `bluetoothctl`. 

By bridging the gap and forcing the connection through Fedora's native `gnome-bluetooth` settings daemon, these scripts ensure your Joy-Cons pair, connect, and disconnect reliably without state mismatches.

## 📦 What's Inside

This repository contains two main shell (`.sh`) scripts that manage the connection state:

*   **The Disconnect Script:** Forcibly removes and unpairs both the Left and Right Joy-Cons from your system. This is crucial for clearing out corrupted pairing states, phantom connections, or ghost devices that the UI thinks are connected but standard command-line tools refuse to recognize.
*   **The Connect Script:** Automatically pairs and connects both Joy-Cons by interfacing directly with `gnome-bluetooth` rather than `bluetoothctl`. This bypasses the connection bug and properly registers the controllers with the system.

## 🚀 Usage

### 1. Make the scripts executable
Before running the scripts for the first time, you need to grant them execution permissions. Open your terminal in the cloned repository folder and run:

```bash
chmod +x connect.sh disconnect.sh
