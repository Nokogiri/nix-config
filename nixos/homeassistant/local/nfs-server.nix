{
  fileSystems."/export/webdav" = {
    device = "/srv/webdav";
    options = [ "bind" ];
  };

  fileSystems."/export/extHDD" = {
    device = "/media/extHDD";
    options = [ "bind" ];
  };

  fileSystems."/export/Downloads" = {
    device = "/var/lib/transmission/Downloads";
    options = [ "bind" ];
  };

  services.nfs.server = {
    enable = true;
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
    extraNfsdConfig = "";
  };
  networking.firewall = {
    #enable = true;
    # for NFSv3; view with `rpcinfo -p`
    allowedTCPPorts = [ 111 2049 4000 4001 4002 20048 ];
    allowedUDPPorts = [ 111 2049 4000 4001 4002 20048 ];
  };
  services.nfs.server.exports = ''
    /export            10.200.200.0/24(rw,fsid=0,no_subtree_check) 192.168.178.0/24(rw,fsid=0,no_subtree_check)
    /export/webdav     10.200.200.0/24(rw,nohide,insecure,no_subtree_check) 192.168.178.0/24(rw,nohide,insecure,no_subtree_check)
    /export/extHDD     10.200.200.0/24(rw,nohide,insecure,no_subtree_check) 192.168.178.0/24(rw,nohide,insecure,no_subtree_check)
    /export/Downloads  10.200.200.0/24(rw,nohide,insecure,no_subtree_check) 192.168.178.0/24(rw,nohide,insecure,no_subtree_check)
  '';
}
