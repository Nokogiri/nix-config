{ config, ... }: {
  systemd.network.networks."90-wireguard" = {
    matchConfig.Name = "calvin";
    address = [ "10.200.200.2/24" ];
    dns = [ "10.200.200.1" ];
    routes = [{
      routeConfig = {
        Destination = "10.200.200.0/24";
        Scope = "link";
      };
    }];
  };
}
