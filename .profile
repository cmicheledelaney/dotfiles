# prevent lid close from sleeping the system due to a kernel bug where the keyboard doesnt work on wake
systemd-inhibit  --what=handle-lid-switch sleep 1d &

# keychain
keychain

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
