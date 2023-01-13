{ lib, config, modulesPath, ... }: {

  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    extraModprobeConfig = ''
      options hid_xpadneo ff_connect_notify=0 quirks=30:03:c8:25:e8:80+32
      blacklist pcspkr
      options usb-storage quirks=090c:1000:,152d:0578:u,0bc2:2322:u
    '';
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" "mt7921e" ];
    };
    kernelModules = [ "kvm-intel" "" ];
    loader.efi.efiSysMountPoint = "/boot";
    supportedFilesystems = [ "ext4" "btrfs" ];
  };

  fileSystems = {
  "/" =
    { device = "/dev/disk/by-uuid/e0958d7e-d5ff-4669-98ce-0406e4ba1a1f";
      fsType = "ext4";
    };

  "/boot/efi" =
    { device = "/dev/disk/by-uuid/20D6-91CA";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/3f477dfb-975d-4e45-abbc-d9729c89a70c";
        priority = 90; }
    ];
  zramSwap = {
    enable = true;
    priority = 5;
  };

  hardware = {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    uinput.enable = true;
    xpadneo.enable = true;

  };

  
  sound.enable = true;

  nixpkgs.hostPlatform = "x86_64-linux";
}
