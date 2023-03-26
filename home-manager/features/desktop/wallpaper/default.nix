{ pkgs, config, ... }: {
  xdg.dataFile."wallpaper".source = ./pictures;
  home.packages = with pkgs; [
    config.nur.repos.aleksana.swww
    (pkgs.writeTextFile {
      name = "swww-init";
      destination = "/bin/swww-init";
      executable = true;
      text =
        #let
        #  wallpaper = ;
        #  color = ;
        #in 
        ''
          swww init && \
          swww clear 24273A && \
          swww img /home/nokogiri/.local/share/wallpaper/Totoro.webp --transition-step 128 --transition-fps 60 --transition-type outer --transition-pos top-left
        '';
    })
  ];
}
