{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    grub.efiSupport = true;
    grub.device = "nodev";
  };
}
