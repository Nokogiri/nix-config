{ pkgs, ... }:
  let udisks-automounter = pkgs.writeShellScriptBin {
    name = "udisks-automount";
    runtimeInputs = with pkgs; [ udisks systemd ];
    text = ''
      pathtoname() {
        udevadm info -p /sys/"$1" | awk -v FS== '/DEVNAME/ {print $2}'
      }

      stdbuf -oL -- udevadm monitor --udev -s block | while read -r -- _ _ event devpath _; do
        if [ "$event" = add ]; then
            devname=$(pathtoname "$devpath")
            udisksctl mount --block-device "$devname" --no-user-interaction
        fi
      done
    '';
  };
in {
  systemd.user.services.udisk-automounter = {
    Unit = {
      Description = "Automount USB Disks.";
      Documentation = "ttps://wiki.archlinux.org/title/Udisks#udevadm_monitor";
    };
    Service = {
      Type = "simple";
      ExecStart = "%h/.nix-profile/bin/udisks-automount";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
