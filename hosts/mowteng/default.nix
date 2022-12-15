# System configuration for my laptop
{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ../common/global
    ../common/users/nokogiri

    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optionql/systemd-boot.nix

  ];

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
    gnupg.enable = true;
    kdeconnect.enable = true;
    tmux.enable = true;
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
}
