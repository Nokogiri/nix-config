# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {

  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    ./hardware-configuration.nix

    ../common/global

    ../common/optional/avahi.nix
    ../common/optional/docker.nix
    ../common/optional/resolved.nix
    ../common/optional/wireguard-server.nix
    ../common/users/nokogiri.nix

    ./local
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

  networking = { hostName = "calvin"; };

  boot = { cleanTmpDir = true; };

  environment.systemPackages = with pkgs; [
    jellyfin-ffmpeg
    mergerfs
    mergerfs-tools
    rclone
    sshfs-fuse
  ];

  hardware = { };

  powerManagement = { cpuFreqGovernor = "performance"; };

  programs = {
    gnupg.agent.enable = true;
    ssh.startAgent = true;
  };

  services.logind.lidSwitch = "ignore";

  location = {
    latitude = 50.9787;
    longitude = 11.03283;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.05";
}
