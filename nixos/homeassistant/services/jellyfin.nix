{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ jellyfin-ffmpeg ];
  services.jellyfin.enable = true;

}
