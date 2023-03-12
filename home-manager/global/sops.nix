# { inputs, ...}:
{
  # Configuration via home.nix
  #imports = [
  #<sops-nix/modules/home-manager/sops.nix>
  #  inputs.sops-nix.nixosModules.sops
  #];
  sops = {
    age.keyFile = "/home/nokogiri/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;
    secrets.spotify = { path = "%r/spotify.txt"; };
  };
}
