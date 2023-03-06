{ pkgs, config, ... }: {
  services.spotifyd = {
    enable = true;
    package = pkgs.spotifyd.override ({
      withALSA = false;
      withPulseAudio = true;
      withMpris = true;
    });
    settings = {
      spotifyd = {
        username = "nokogiri@gefjon.org";
        password_cmd = "cat $XDG_RUNTIME_DIR/spotify.txt";
        use_mpris = true;
        backend = "pulseaudio";
        device_name = "mowteng";
        bitrate = 320;
        cache_path = "${config.home.homeDirectory}/.cache/spotifyd";
        max_cache_size = 9000000000;
        device_type = "speaker";
      };
    };
  };
}
