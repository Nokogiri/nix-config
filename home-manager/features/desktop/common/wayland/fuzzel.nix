{ pkgs, ... }: {
  home.packages = [
    pkgs.fuzzel
    pkgs.pass-fuzzel
    (pkgs.writeTextFile {
      name = "hyprfuzzel";
      destination = "/bin/hyprfuzzel";
      executable = true;
      text = ''
        ${pkgs.fuzzel}/bin/fuzzel --log-level=error --show-actions -w 45 -l 25 --layer=overlay  
      '';
    })
  ];
}
