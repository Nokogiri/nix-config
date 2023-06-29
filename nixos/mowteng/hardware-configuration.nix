{ lib, config, modulesPath, pkgs, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      options hid_xpadneo ff_connect_notify=0 quirks=e4:17:d8:45:f4:77:7,16
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
      options iwlwifi power_save=1 power_level=5 uapsd_disable=0
      options iwlmvm power_scheme=3
    '';
    extraModulePackages = with config.boot.kernelPackages; [
      cpupower
      zenpower
    ];
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" ];
      kernelModules = [ "amdgpu" "cpufreq_conservative" ];
    };
    kernelModules = [ "kvm-amd" "zenpower" ];
    kernelPackages = pkgs.linuxPackages_latest;
    # passive epp
    kernelParams = [
      "amd_pstate=passive"
      "mitigations=off"
      "cpufreq.default_governor=ondemand"
    ];
    # guided
    #kernelParams = [ "amd_pstate=guided" "mitigations=off" "cpufreq.default_governor=schedutil" ];
    # active epp
    #kernelParams = [ "amd_pstate=active" "mitigations=off" "cpufreq.default_governor=powersave" "cpufreq.energy_performance_preference=balance_power" ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = [ "btrfs" ];
    tmp.cleanOnBoot = true;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/root" "compress=zstd" ];
    };

    "/var/lib" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/lib" "compress=zstd" ];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/log" "compress=zstd" ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=nixos/store" "compress=zstd" ];
    };

    "/home/nokogiri" = {
      device = "/dev/disk/by-uuid/c8743301-ac42-42f6-9570-12f2f177148d";
      fsType = "btrfs";
      options = [ "subvol=@nokogiri" "compress=zstd" ];
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
    steam-hardware.enable = true;
    uinput.enable = true;
    xpadneo.enable = true;
  };

  sound.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
