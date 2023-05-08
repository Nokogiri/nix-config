{
  services.resolved = {
    enable = true;
    domains = [ "home.arpa" ];
    llmnr = "false";
    extraConfig = ''
      MulticastDNS=resolve
    '';
  };
}
