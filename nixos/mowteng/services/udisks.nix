{
  services = {
    udev.extraRules = ''
      ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"
    '';
    udisks2 = {
      enable = true;
      settings = {
        "mount_options.conf" = {
          "defaults" = {
            ntfs_defaults = "uid=$UID,gid=$GID";
          };
          "/dev/disk/by-uuid/542cd982-4845-4dbf-adad-de6536caf0e6" = {
            defaults = "compress-force=zstd:6";
          };
          "/dev/disk/by-uuid/4bf92d1a-b177-4f5d-ae06-927acbb655ea" = {
            defaults = "compress-force=zstd:6";
          };
          "/dev/disk/by-uuid/4042086d-7f6b-4aa0-8e7b-c7cab0a83d8b" = {
            defaults = "compress-force=zstd:6";
          };
        };
      };
    };
  };
}
