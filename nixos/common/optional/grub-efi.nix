{
  boot.loader = {
    #systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    grub.efiSupport = true;
    grub.device = "nodev";
  };
}
