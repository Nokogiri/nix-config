# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-intel
    #inputs.hardware.nixosModules.common-gpu-nvidia
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global

    ../common/optional/avahi.nix
    ../common/optional/bluetooth.nix
    #../common/optional/desktop.nix
    ../common/optional/distrobox-nvidia.nix
    ../common/optional/fonts.nix
    ../common/optional/networkmanager.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/resolved.nix
    ../common/optional/sane.nix
    #../common/optional/steam.nix
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
    hostName = "consolero";
    hostId = "06fc131c";
  };

  boot = {
    cleanTmpDir = true;
    extraModulePackages = with config.boot.kernelPackages; [ ];
    kernelPackages = pkgs.linuxPackages_lqx;
  };

  #environment.variables.AMD_VULKAN_ICD = lib.mkDefault "RADV";

  environment.systemPackages = with pkgs; [
    lm_sensors
    exfatprogs
    nvtop-nvidia
  ];
  hardware = {
    wirelessRegulatoryDatabase = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };
    opengl = {
      enable = true;
      #extraPackages = with pkgs; [ amdvlk ];

      driSupport = true;
      driSupport32Bit = true;
    };
  };

  #powerManagement = {
  #  cpuFreqGovernor = "ondemand";
  #  powertop.enable = false;
  #};

  services.fwupd.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "nokogiri";
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  programs = { mtr.enable = true; };

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  services.logind.extraConfig = ''
    RuntimeDirectorySize=8G
  '';
  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
