# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example' or (legacy) 'nix-build -A example'

{ pkgs ? (import ../nixpkgs.nix) { } }: {
  # example = pkgs.callPackage ./example { };
  plymouth-spinner-monochrome =
    pkgs.callPackage ./plymouth-spinner-monochrome { };
  ryzen-ppd = pkgs.callPackage ./ryzen-ppd { };
  catppuccin-gtk-frappe-teal =
    pkgs.callPackage ./catppuccin-gtk-frappe-teal { };
  colloid-cursors = pkgs.callPackage ./colloid-cursors { };
}
