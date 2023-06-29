{ pkgs, config, lib, inputs, outputs, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  #  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.mutableUsers = true;
  users.users.nokogiri = {
    description = "It'sa Me Nokogiri...a!";
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "video" "audio" ] ++ ifTheyExist [
      "network"
      "networkmanager"
      "wireshark"
      "i2c"
      "mysql"
      "docker"
      "podman"
      "git"
      "libvirtd"
      "deluge"
      "jellyfin"
      "uinput"
      "podman"
      "rtkit"
      "vboxusers"
      "input"
      "webdav"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExoigGlfblca2iJPTcyRc/bL5hqHuDlXmbBf/9PhVKZ nokogiri@frankenbook"
    ];
    #passwordFile = config.sops.secrets.nokogiri-password.path;
    packages = [ pkgs.home-manager ];
  };
  #home-manager = {
  #  extraSpecialArgs = { inherit inputs outputs; };
  #  users = {
  # Import your home-manager configuration
  #    nokogiri = import ../../../home-manager/${config.networking.hostName}.nix;
  #  };
  #};
  services.geoclue2.enable = true;
  #security.pam.services = { swaylock = { }; };
}
