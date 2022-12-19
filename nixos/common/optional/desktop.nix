{
  networking = {
    firewall = {
      trustedInterfaces = [ "wg0" "wlp3s0" ];
      allowedUDPPorts = [ 5353 ];
    };
  };
  programs.dconf.enable = true;

  services = {
    dbus.enable = true;
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
  };
}
