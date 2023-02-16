{ pkgs, ... }: {
  services.spotifyd = {
    enable = true;
    package = pkgs.spotifyd.override ({
      withALSA = false;
      withPulseAudio = true;
      withMpris = true;
    });
  };
}
