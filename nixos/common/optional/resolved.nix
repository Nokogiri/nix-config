{
  services.resolved = {
    enable = true;
    extraConfig = ''
      Domains=home.arpa
      MulticastDNS=false
      LLMNR=false
    '';
  };
}
