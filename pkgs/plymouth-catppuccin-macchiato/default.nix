{ stdenv, logo ? null, lib, ... }:
stdenv.mkDerivation {
  pname = "plymouth-catppuccin-macchiato";
  version = "1.0";
  src = ./src;

  buildPhase = lib.optionalString (logo != null) ''
    cp $src . -r
    ln -s ${logo} ./share/plymouth/themes/catppuccin-macchiato/watermark.png
  '';

  installPhase = ''
    cp -r . $out
  '';

  meta = { platforms = lib.platforms.all; };
}
