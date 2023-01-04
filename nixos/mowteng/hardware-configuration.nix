{ lib, config, modulesPath, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      options hid_xpadneo ff_connect_notify=0 quirks=30:03:c8:25:e8:80+32
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    '';
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" ];
      kernelModules = [ "amd_pstate" "amdgpu" "mt7921e" ];
    };
    kernelModules = [ "kvm-amd" "zenpower" ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = [ "btrfs" ];
  };

  fileSystems = {
  "/" =
    { device = "/dev/disk/by-uuid/faaa7f5b-84cb-4fe4-b204-4089702f8dc8";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd:6" ];
    };

    "/nix" =
    { device = "/dev/disk/by-uuid/faaa7f5b-84cb-4fe4-b204-4089702f8dc8";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd:6" "noatime" ];
    };

    "/home" =
    { device = "/dev/disk/by-uuid/623581cb-fdde-420b-ab2b-c2a0a8228fe4";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd:6" ];
    };

    "/home/Games" =
    { device = "/dev/disk/by-uuid/623581cb-fdde-420b-ab2b-c2a0a8228fe4";
      fsType = "btrfs";
      options = [ "subvol=games" "compress=zstd:6" ];
    };

    "/var/lib" =
    { device = "/dev/disk/by-uuid/faaa7f5b-84cb-4fe4-b204-4089702f8dc8";
      fsType = "btrfs";
      options = [ "subvol=var/lib" ];
    };

    "/var/log" =
    { device = "/dev/disk/by-uuid/faaa7f5b-84cb-4fe4-b204-4089702f8dc8";
      fsType = "btrfs";
      options = [ "subvol=var/log" ];
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

  hardware = {
    cpu.amd.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;

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
