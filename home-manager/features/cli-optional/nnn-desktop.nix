{ pkgs, ... }: {
  programs.nnn = {
    extraPackages = with pkgs; [
      djvulibre
      ffmpegthumbnailer
      ffmpeg
      fontpreview
      glow
      gnome-epub-thumbnailer
      imagemagick
      pistol
      poppler_utils
    ];
  };
  #home.sessionVariables = {
  #  USE_PISTOL = "1"
  #};
}
