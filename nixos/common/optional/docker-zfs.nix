{ pkgs, ...}:{ #virtualisation = { docker = { storageDriver = "zfs"; }; }; 
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    #defaultNetwork.dnsname.enable = true;
    extraPackages = [ pkgs.zfs ];
  };
}
