{ pkgs, ... }: {
  services.xserver = {
    displayManager.sddm = { enable = false; };
    enable = true;
    enableTCP = true;
    layout = "us,de";
    libinput = { enable = true; };
    videoDrivers = [ "amdgpu" ];
    wacom.enable = true;
    windowManager.i3.enable = true;
    xkbOptions = "grp:alt_space_toggle";
    xkbVariant = "altgr-intl";
  };
}
