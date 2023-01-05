{ lib
, pkgs
, stdenv
, fetchFromGitHub
, makeWrapper
, pass
, jq
, fuzzel
, libnotify
, wl-clipboard
, findutils
, gnused
, coreutils
, hyprland
}:

with lib;

stdenv.mkDerivation {
  name = "pass-fuzzel";
  version = "1.0";
  src = ./pass-fuzzel.sh;

  nativeBuildInputs = [ makeWrapper ];

  dontUnpack = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    install -Dm 0755 $src $out/bin/pass-fuzzel
    wrapProgram $out/bin/pass-fuzzel --set PATH \
      "${
        makeBinPath [
          pass
          jq
          fuzzel
          libnotify
          wl-clipboard
          findutils
          gnused
          coreutils
          hyprland
        ]
      }"
  '';

  meta = {
    description = "A fuzzel graphical menu for pass";
    license = licenses.mit;
    platforms = platforms.all;
  };
}

