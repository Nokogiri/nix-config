{
  services = {
    gnome-keyring = {
      enable = true;
      components = [ "secrets" ];
    };
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
    };
  };
}
