# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, outputs, ... }: {
  imports = [
    #inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-index-database.nixosModules.nix-index

    ./console.nix
    ./doas.nix
    ./fish.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./sops.nix
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  environment = {
    #persistence = {
    #  "/persist".directories = [ "/var/lib/systemd" "/var/log" "/srv" ];
    #};
    enableAllTerminfo = false;
    pathsToLink = [ "/share/nix-direnv" "/share/zsh" "/share/bash-completion" ];
  };

  programs.fuse.userAllowOther = true;
  programs.git.enable = true;
  programs.nix-index-database.comma.enable = true;
  programs.nix-index.enableZshIntegration = false;
  programs.nix-index.enableBashIntegration = false;
  hardware.enableRedistributableFirmware = true;

  # Increase open file limit for sudoers
  security.pam.loginLimits = [
    {
      domain = "@wheel";
      item = "nofile";
      type = "soft";
      value = "524288";
    }
    {
      domain = "@wheel";
      item = "nofile";
      type = "hard";
      value = "1048576";
    }
  ];
}
