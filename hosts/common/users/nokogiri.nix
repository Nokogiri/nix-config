{ pkgs, config, lib, outputs, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.nokogiri = {
    description = "It'sa Me Nokogiri...a!";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "video" "audio" ] ++ ifTheyExist [
      "network"
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
    ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExoigGlfblca2iJPTcyRc/bL5hqHuDlXmbBf/9PhVKZ nokogiri@frankenbook"
    ];
    passwordFile = config.sops.secrets.nokogiri-password.path;
    packages = [ pkgs.home-manager ];
  };

  sops.secrets.nokogiri-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  home-manager.users.nokogiri =
    import ../../../home/nokogiri/${config.networking.hostName}.nix;

  services.geoclue2.enable = true;
  security.pam.services = { swaylock = { }; };
}
