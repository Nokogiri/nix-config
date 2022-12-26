{lib, config, ...}:# This is just an example, you should generate yours with nixos-generate-config and put it in here.
{

  boot = {
    blacklistedKernelModules = [ "b43" "snd_had_intel" ];
    consoleLogLevel = 3;
    extraModprobeConfig = ''
      options hid_apple fnmode=2 swap_fn_leftctrl=1 iso_layout=0
    '';
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "firewire_ohci"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "sdhci_pci"
      ];
      kernelModules = [ "hid-apple" ];
    };
    kernelModules = [ "kvm-intel" ];
    kernelParams = [
      "acpi_backlight=vendor"
      "intremap=off"
      "i915.fastboot=1"
      "i915.enable_guc=2"
      "i915.enable_fbc=1"
      "i915_enable_rc6=7"
      "noibrs"
      "noibpb"
      "nopti"
      "nospectre_v2"
      "nospectre_v1"
      "l1tf=off"
      "nospec_store_bypass_disable"
      "no_stf_barrier"
      "mds=off"
      "tsx=on"
      "tsx_async_abort=off"
      "mitigations=off"
      "sdhci.debug_quirks2=4"
    ];
    supportedFilesystems = [ "zfs" ];
  };

  fileSystems."/" = {
    device = "homeassistant/system/root";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/var/lib" = {
    device = "homeassistant/system/var/lib";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/var/log" = {
    device = "homeassistant/system/var/log";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/tmp" = {
    device = "homeassistant/system/tmp";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/home" = {
    device = "homeassistant/data/home";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  fileSystems."/nix" = {
    device = "homeassistant/local/nix";
    fsType = "zfs";
    options = [ "zfsutil" "X-mount.mkdir" ];
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/8638fc3c-846e-49ea-9307-5194a729e74c"; }];

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/67E3-17ED";
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

  hardware = {
    cpu.intel.updateMicrocode =
      lib.mkDefault config.hardware.enableRedistributableFirmware;
    enableRedistributableFirmware = true;
    bluetooth.enable = false;
  };
  # Set your system kind (needed for flakes)
  nixpkgs.hostPlatform = "x86_64-linux";
}
