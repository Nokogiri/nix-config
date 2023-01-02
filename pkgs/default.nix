# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
  catppuccin-gtk-frappe-teal =
    pkgs.callPackage ./catppuccin-gtk-frappe-teal { };
  colloid-cursors = pkgs.callPackage ./colloid-cursors { };
  heroic-unwrapped = pkgs.callPackage ./heroic { };
  heroic = pkgs.callPackage ./heroic/fhsenv.nix { };
  iio-sensor-proxy = pkgs.callPackage ./iio-sensor-proxy { };
  mailctl = pkgs.callPackage ./mailctl { };
  nix-stray-roots = pkgs.callPackage ./nix-stray-roots { };
  pass-fuzzel = pkgs.callPackage ./pass-fuzzel { };
  pass-wofi = pkgs.callPackage ./pass-wofi { };
  plymouth-spinner-monochrome =
    pkgs.callPackage ./plymouth-spinner-monochrome { };
  RBDOOM-3-BFG = pkgs.callPackage ./RBDOOM-3-BFG { };
  RBDOOM-3-BFG-vk = pkgs.callPackage ./RBDOOM-3-BFG-vk { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  swww = pkgs.callPackage ./swww { };
}
