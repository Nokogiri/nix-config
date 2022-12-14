{
  boot = {
    cleanTmpDir = true;
    consoleLogLevel = 3;
    extraModprobeConfig = ''
      options hid_xpadneo ff_connect_notify=0 quirks=30:03:c8:25:e8:80+32
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    '';
    extraModulePackages = [ pkgs.linuxPackages_lqx.zenpower ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "sd_mod" ];
      kernelModules = [ "amd_pstate" "amdgpu" ];
    };
    kernelModules = [ "kvm-amd" "zenpower" "msr" ];
    kernelPackages = pkgs.linuxPackages_lqx;
    kernelPatches = [{
      name = "d3cold-fix";
      patch = ./patches/d3cold.patch;
    }];
    loader.efi.efiSysMountPoint = "/boot";
    plymouth = {
      enable = true;
    };
    supportedFilesystems = [ "zfs" ];
  };
  
  fileSystems = {
    "/" = {
      device = "mowteng/system/root";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/tmp" = {
      device = "mowteng/system/tmp";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/home" = {
      device = "mowteng/data/home";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/nix" = {
      device = "mowteng/local/nix";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/var/lib" = {
      device = "mowteng/system/var/lib";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/var/log" = {
      device = "mowteng/system/var/log";
      fsType = "zfs";
      options = [ "zfsutil" "X-mount.mkdir" ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/67B9-6ED6";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
        "codepage=437"
        "iocharset=ascii"
        "shortname=mixed"
        "utf8"
      ];
    };
  };
  swapDevices =
    [{ device = "/dev/disk/by-uuid/b6b88dbb-ad22-4746-ba8a-a1c32b3a184f"; }];


}
