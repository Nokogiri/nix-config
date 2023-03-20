{ pkgs, ... }: {
  #  home.packages = with pkgs; [
  #    obs-studio-plugins.obs-vkcapture
  #    obs-studio-plugins.wlrobs
  #    obs-studio-plugins.obs-vaapi
  #    obs-studio-plugins.obs-pipewire-audio-capture
  #  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-vaapi
      obs-vkcapture
      wlrobs
    ];
  };
}
