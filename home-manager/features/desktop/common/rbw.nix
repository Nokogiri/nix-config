{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-rbw
    pinentry
    #wofi
  ];
  programs.rbw = {
    enable = true;
    settings = {
      email = "m.pappe@gefjon.org";
      base_url = "https://vault.fishoeder.net";
      pinentry = "gnome3";
    };
  };
}
