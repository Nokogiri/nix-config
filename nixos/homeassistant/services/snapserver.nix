{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ librespot ];
  services.snapserver = {
    enable = true;
    tcp.enable = true;
    openFirewall = true;
    http = {
      listenAddress = "0.0.0.0";
      enable = true;
      docRoot = "${pkgs.snapcast}/share/snapserver/snapweb";
    };
    streams = {
      "AllSpotify" = {
        type = "librespot";
        location = "${pkgs.librespot}/bin/librespot";
        codec = "flac";
      };
      "KucheSPotify" = {
        type = "librespot";
        location = "${pkgs.librespot}/bin/librespot";
        codec = "flac";
      };
    };
  };
}
