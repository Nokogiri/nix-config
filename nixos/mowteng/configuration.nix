# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-amd
    #inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global

    ../common/optional/avahi.nix
    ../common/optional/bluetooth.nix
    ../common/optional/desktop.nix
    ../common/optional/fonts.nix
    #../common/optional/libvirt.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/steam.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/xdg-portal.nix

    ../common/users/nokogiri.nix

    ./services
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions

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
    extraModulePackages = [ pkgs.linuxPackages_lqx.zenpower ];
    kernelPackages = pkgs.linuxPackages_lqx;
    kernelPatches = [{
      name = "d3cold-fix";
      patch = ./patches/d3cold.patch;
    }];
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    lm_sensors
    linuxKernel.packages.linux_lqx.cpupower
  ];

  hardware = {
    opengl = {
      enable = true;
      #extraPackages = with pkgs; [ amdvlk ];

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
  };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}
