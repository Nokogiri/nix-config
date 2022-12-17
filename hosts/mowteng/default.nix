# System configuration for my laptop
{ pkgs, inputs, lib, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/nokogiri.nix

    ../common/optional/avahi.nix

    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/ryzen-ppd.nix
    ../common/optional/sane.nix
    ../common/optional/systemd-boot.nix
    ../common/optional/wireless.nix

    ./services/tlp.nix
    ./services/wireguard.nix
  ];

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

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
  };

  environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    lm_sensors
    linuxKernel.packages.linux_lqx.cpupower
  ];

  programs = {
    light.enable = true;
    dconf.enable = true;
    gnupg.agent.enable = true;
    kdeconnect.enable = true;
  };

  powerManagement = {
    cpuFreqGovernor = "ondemand";
    powertop.enable = false;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };
  system.stateVersion = "22.05";
}
