# This file (and the global directory) holds config that i use on all hosts
{ lib, inputs, ... }: {
  imports = [
    #inputs.impermanence.nixosModules.impermanence
    inputs.home-manager.nixosModules.home-manager
    ./doas.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./sops.nix
    ./systemd-network.nix
    ./zsh.nix
  ]; #++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
  };

  environment = {
    #persistence = {
    #  "/persist".directories = [ "/var/lib/systemd" "/var/log" "/srv" ];
    #};
    enableAllTerminfo = true;
    pathsToLink = [ "/share/nix-direnv" "/share/zsh" ];
  };

  programs.fuse.userAllowOther = true;
  programs.git.enable = true;
  programs.gnupg.agent.enable = true;
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
