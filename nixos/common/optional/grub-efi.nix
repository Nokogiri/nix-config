{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
    grub.efiSupport = true;
    grub.device = "nodev";
  };
}
