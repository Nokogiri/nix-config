{ config, pkgs, lib, ... }:

{
  systemd.user.services = {
    rclone-nokogiri = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config nokogiri";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    nokogiri: /media/cloud/nokogiri
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u /media/cloud/nokogiri";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };

    rclone-lyria = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config lyria";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    lyria:Media /media/cloud/Media/lyria
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u /media/cloud/Media/lyria";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };

    rclone-guntheria = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config guntheria";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    guntheria:Media /media/cloud/Media/guntheria
        '';
        ExecStop =
          "/run/wrappers/bin/fusermount -u /media/cloud/Media/guntheria";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };

    rclone-markus = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config markus";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    markus:Media /media/cloud/Media/markus
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u /media/cloud/Media/markus";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };
    rclone-kenny = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config kenny";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    kenny:Media /media/cloud/Media/kenny
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u /media/cloud/Media/kenny";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };
    rclone-hildi = {
      enable = true;
      description =
        "rclone: Remote FUSE filesystem for cloud storage config hildi";
      documentation = [ "man:rclone(1)" ];
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "notify";
        ExecStart = ''
          ${pkgs.rclone}/bin/rclone mount \
                    --config=%h/.config/rclone/rclone.conf \
                    --vfs-cache-mode full \
                    --vfs-cache-max-size 256M \
                    --log-level INFO \
                    --log-file /tmp/rclone-%i.log \
                    --umask 002 \
                    --allow-other \
                    --allow-non-empty \
                    --dir-cache-time 48h \
                    --poll-interval 5m \
                    --gid 994 \
                    hildi:Media /media/cloud/Media/hildi
        '';
        ExecStop = "/run/wrappers/bin/fusermount -u /media/cloud/Media/hildi";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
    };
  };
}

