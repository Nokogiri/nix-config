# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{ pkgs ? (import ../nixpkgs.nix) { } }: {
  amdctl = pkgs.callPackage ./amdctl { };
  #cemu = pkgs.callPackage ./cemu { };
  #heroic-unwrapped = pkgs.callPackage ./heroic { };
  #heroic = pkgs.callPackage ./heroic/fhsenv.nix { };
  iio-sensor-proxy = pkgs.callPackage ./iio-sensor-proxy { };
  #lf-sixel = pkgs.callPackage ./lf-sixel { };
  mpv-unwrapped = pkgs.callPackage ./mpv { };
  wrapMpv = pkgs.callPackage ./mpv/wrapper.nix { };
  mpv = pkgs.wrapMpv pkgs.mpv-unwrapped { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  plymouth-spinner-monochrome =
    pkgs.callPackage ./plymouth-spinner-monochrome { };
  plymouth-catppuccin-frappe =
    pkgs.callPackage ./plymouth-catppuccin-frappe { };
  plymouth-catppuccin-macchiato =
    pkgs.callPackage ./plymouth-catppuccin-macchiato { };
  plymouth-catppuccin-mocha =
    pkgs.callPackage ./plymouth-catppuccin-mocha { };
  openmw = pkgs.libsForQt5.callPackage ./openmw { };
  portmod = pkgs.callPackage ./portmod {};
  RBDOOM-3-BFG = pkgs.callPackage ./RBDOOM-3-BFG { };
  RBDOOM-3-BFG-vk = pkgs.callPackage ./RBDOOM-3-BFG-vk { };
  #ryujinx = pkgs.callPackage ./ryujinx { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  waydroid = pkgs.callPackage ./waydroid {};
  qtstyleplugin-kvantum-qt6 = pkgs.qt6Packages.callPackage ./qtstyleplugin-kvantum { };
}
