{ pkgs, ... }:
let user = "nokogiri";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd '$SHELL -l'";
        user = "greeter";
      };
      #initial_session = {
      #  command = "$SHELL -l";
      #  inherit user;
      #};
    };
  };
}

