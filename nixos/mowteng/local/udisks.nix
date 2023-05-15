{
  services = {
    udev.extraRules = ''
      ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
    '';
    udisks2 = {
      enable = true;
      settings = {
        "mount_options.conf" = {
          "defaults" = { ntfs_defaults = "uid=$UID,gid=$GID"; };
          "/dev/disk/by-uuid/935542df-25dc-492a-ba08-8b5ee7d5d285" = {
            defaults = "compress-force=zstd:9";
          };
        };
      };
    };
  };
}
