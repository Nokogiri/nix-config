{ stdenv, fetchzip, zip, lib, gtk_engines }:

stdenv.mkDerivation rec {
  pname = "catppuccin-gtk-frappe-teal";
  version = "0.2.7";
  src = fetchTarball {
    url =
      "https://codeberg.org/nokogiri/nixos/raw/branch/main/source/catppucin-frappe-teal.tar.xz";
    sha256 = "0w4xaxahcg80mwz89b607whv58885dfna609mnmmnzw45k4y6gl8";
  };

  propagatedUserEnvPkgs = [ gtk_engines ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/themes
    cp -r $src/* $out/share/themes
    runHook postInstall
  '';
}
