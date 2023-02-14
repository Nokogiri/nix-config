# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'
{ pkgs ? (import ../nixpkgs.nix) { } }: {
  amdctl = pkgs.callPackage ./amdctl { };
  cemu = pkgs.callPackage ./cemu { };
  heroic-unwrapped = pkgs.callPackage ./heroic { };
  heroic = pkgs.callPackage ./heroic/fhsenv.nix { };
  iio-sensor-proxy = pkgs.callPackage ./iio-sensor-proxy { };
  mailctl = pkgs.callPackage ./mailctl { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  plymouth-spinner-monochrome =
    pkgs.callPackage ./plymouth-spinner-monochrome { };
  plymouth-catppuccin-frappe =
    pkgs.callPackage ./plymouth-catppuccin-frappe { };
  RBDOOM-3-BFG = pkgs.callPackage ./RBDOOM-3-BFG { };
  RBDOOM-3-BFG-vk = pkgs.callPackage ./RBDOOM-3-BFG-vk { };
  ryujinx = pkgs.callPackage ./ryujinx { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  swww = pkgs.callPackage ./swww { };
}
