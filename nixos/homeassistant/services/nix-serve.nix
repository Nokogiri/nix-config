{
  services.nix-serve = {
    enable = true;
    secretKeyFile = "/var/lib/nix_serve/cache-priv-key.pem";
  };
}
