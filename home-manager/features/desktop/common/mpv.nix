{ pkgs, ... }: {

  nixpkgs.config.packageOverrides = pkgs:
    with pkgs; {
      mpv = mpv.override { scripts = [ pkgs.mpvScripts.mpris ]; };
    };
  home.packages = with pkgs; [ mpv ];
}
