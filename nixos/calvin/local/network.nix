{
  networking = {
    hostName = "calvin";
    useDHCP = false;
    firewall = { trustedInterfaces = [ "wg0" ]; };
  };

  systemd.network = {
    enable = true;

    networks."40-static" = {
      matchConfig.Name = [ "ens*" ];
      address = [ "46.38.240.252/22" "2a03:4000:7:3f4::1/64" ];
      gateway = [ "46.38.240.1" "fe80::1" ];
      dns = [ "46.38.225.230" "46.38.252.230" "2a03:4000:0:1::e1e6" ];
    };
  };
}
