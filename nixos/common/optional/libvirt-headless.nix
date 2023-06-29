{ pkgs, ... }: {
  security.polkit.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    #allowedBridges = [ "br0" "virbr0" ];
    extraConfig = ''
      listen_tls = 0
      listen_tcp = 1
      auth_tcp="none"
    '';
    #extraOptions = [ "--listen" ];
  };
  #environment.systemPackages = with pkgs; [
  #  virt-manager
  #  virt-manager-qt
  #  virt-top
  #];
}
