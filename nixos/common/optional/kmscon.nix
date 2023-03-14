{ pkgs, ... }: {
  services.kmscon = {
    enable = true;
    fonts = [{ name = "CaskaydiaCove Nerd Font Mono"; }];
    hwRender = false;
  };
}
