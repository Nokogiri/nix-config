{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.nfs-utils ];
  services.rpcbind.enable = true; # needed for NFS
  systemd.mounts = let
    commonMountOptions = {
      type = "nfs";
      mountConfig = { Options = "noatime,nfsvers=4.2"; };
    };

  in [
    (commonMountOptions // {
      what = "10.200.200.1:/webdav";
      where = "/media/nfs/Obsidian";
    })

    (commonMountOptions // {
      what = "10.200.200.1:/Downloads";
      where = "/media/nfs/Downloads";
    })

    (commonMountOptions // {
      what = "10.200.200.1:/extHDD";
      where = "/media/nfs/extHDD";
    })
  ];

  systemd.automounts = let
    commonAutoMountOptions = {
      wantedBy = [ "multi-user.target" ];
      automountConfig = { TimeoutIdleSec = "600"; };
    };

  in [
    (commonAutoMountOptions // { where = "/media/nfs/Obsidian"; })
    (commonAutoMountOptions // { where = "/media/nfs/Downloads"; })
    (commonAutoMountOptions // { where = "/media/nfs/extHDD"; })
  ];
}
