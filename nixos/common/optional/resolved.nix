{
  services.resolved = {
    enable = true;
    extraConfig = ''
      Domains=home.arpa
      MulticastDNS=resolve
      LLMNR=resolvee
    '';
  };
}
