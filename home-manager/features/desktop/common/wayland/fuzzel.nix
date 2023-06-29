{ pkgs, ... }: {
  home.packages = [
    pkgs.fuzzel
    pkgs.pass-fuzzel
    (pkgs.writeTextFile {
      name = "hyprfuzzel";
      destination = "/bin/hyprfuzzel";
      executable = true;
      text = ''
        ${pkgs.fuzzel}/bin/fuzzel --log-level=error -w 45 -l 25 --layer=overlay  
      '';
    })
  ];
  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    # output=<not set>
    # font=monospace
    font=CaskaydiaCove Nerd Font:size=13
    dpi-aware=no
    prompt=➟ 
    icon-theme=Papirus-Dark
    icons-enabled=yes
    fields=filename,name,generic
    #password-character=*
    fuzzy=yes
    # show-actions=no
    # terminal=$TERMINAL -e  # Note: you cannot actually use environment variables here
    terminal=kitty
    # launch-prefix=<not set>

    width=35
    horizontal-pad=10
    vertical-pad=10
    inner-pad=10
    line-height=18


    [colors]
    background=303446aa
    text=C6D0F5ff
    match=a6d189ff
    selection=303446ff
    selection-text=81c8beff
    selection-match=ef9f76ff
    border=303446ff
    # border=002b36ff

    [border]
    width=1
    radius=3

    [dmenu]
    mode=text  # text|index
    # exit-immediately-if-empty=no
  '';
}
