{ config, lib, ... }: {
  # Wireless secrets stored through sops
  sops.secrets.wireless = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };

  #networking.dhcpcd.enable = true;

  networking.wireless = {
    enable = true;
    environmentFile = config.sops.secrets.wireless.path;
    networks = { "(=^--^=)" = { psk = "@PSK_HOME@"; }; };
    # Imperative
    allowAuxiliaryImperativeNetworks = true;
    userControlled = {
      enable = true;
      group = "network";
    };
    extraConfig = ''
      update_config=1
    '';
  };
  users.groups.network = { };

  #  systemd.network.networks."25-wireless" = {
  #    matchConfig.Name = [ "wl*" ];
  #    DHCP = "yes";
  #    dhcpV4Config = {
  #      RouteMetric = 20;
  #      UseDNS = true;
  #      UseRoutes = true;
  #      UseDomains = true;
  #    };
  #  };
}

