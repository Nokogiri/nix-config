{pkgs, ...}:{
  environment.systemPackages = with pkgs; [ librespot ];  
  services.snapserver = {
    enable = true;
    tcp.enable = true;
    openFirewall = true;
    streams = {
      "MichaSpotify" = {
        type = "librespot";
        location = "${pkgs.librespot}/bin/librespot";
        codec = "flac";
      };
    };
  };
}
