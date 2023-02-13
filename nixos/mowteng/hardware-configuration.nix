{ lib, config, modulesPath, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      options hid_xpadneo ff_connect_notify=0 quirks=e4:17:d8:45:f4:77:7,16
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
      options iwlwifi power_save=1 uapsd_disable=0
      options iwlmvm power_scheme=3
    '';
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" ];
      kernelModules = [ "amdgpu" ];
    };
    kernelModules = [ "kvm-amd" "zenpower" ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = [ "btrfs" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b465287b-b5cb-4fce-98fb-bb8a407f2f62";
      fsType = "btrfs";
      options = [ "compress-force=zstd:12" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/a2c1b7e0-55e2-4ae5-bd09-a3434b5b6ea9";
      fsType = "btrfs";
      options = [ "compress=zstd:6" ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/8C9D-013B";
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

  swapDevices = [{
    device = "/dev/disk/by-uuid/93ae631f-7897-4c18-afd6-95d17c14ae2c";
    priority = 100;
  }];

  zramSwap = {
    enable = true;
    priority = 5;
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    sensor.iio.enable = true;
    uinput.enable = true;
    xpadneo.enable = true;

  };

  services.zfs = {
    autoScrub.enable = true;
    trim.enable = true;
  };

  sound.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
