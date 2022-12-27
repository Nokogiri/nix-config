{
  services.resolved = {
    enable = true;
    extraConfig = ''
      Domains=home.arpa
      MulticastDNS=true
      LLMNR=true
    '';
  };
}
