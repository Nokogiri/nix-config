{lib, inputs, ...}:{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      hidpi = false;
    };
    recommendedEnvironment = true;
    extraConfig = ( import ./config.nix);
  };
}
