# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/optional/avahi.nix
    ../common/optional/bluetooth.nix
    ../common/optional/desktop-common.nix
    #../common/optional/distrobox.nix
    ../common/optional/fonts.nix
    ../common/optional/fprintd.nix
    ../common/optional/greetd.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/resolved.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/xdg-portal.nix
    #../common/optional/xserver.nix

    ../common/users/nokogiri.nix

    ./services
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions

      #(self: super: {
      #    mangohud = inputs.masterpkgs.legacyPackages.x86_64-linux.mangohud;
      #})

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = { allowUnfree = true; };
  };

  networking = {
    hostName = "mowteng";
    hostId = "05fc191c";
  };

  boot = {
    cleanTmpDir = true;
    extraModulePackages = with config.boot.kernelPackages; [
      zenpower
      turbostat
      cpupower
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "amd_pstate=passive" "mitigations=off" ];
    tmpOnTmpfs = true;
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    amdctl
    cifs-utils
    lm_sensors
    exfatprogs
  ];

  fileSystems."/media/haos" = {
    device = "//192.168.178.57/public";
    fsType = "cifs";
    options = [
      "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,uid=1000,gid=100"
    ];
  };

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ mangohud ];
      extraPackages32 = with pkgs; [ mangohud ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  powerManagement = {
    cpuFreqGovernor = "ondemand";
    powertop.enable = false;
  };

  programs = {
    light.enable = true;
    mtr.enable = true;
    sway.enable = true;
  };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  services.logind.extraConfig = ''
    RuntimeDirectorySize=8G
  '';
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}
