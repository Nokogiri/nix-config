{
  imports = [
    ./firewall.nix
    ./nginx.nix
    ./nix-serve.nix
    ./systemd-network.nix
    ./rclone.nix
    ./jellyfin.nix
    ./transmission.nix
  ];
}
