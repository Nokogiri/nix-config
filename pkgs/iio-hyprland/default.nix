{ lib
, stdenv
, fetchgit
, meson
, pkg-config
, ninja
, dbus
, cmake
, systemd
}:

stdenv.mkDerivation rec {
  pname = "iio-hyprland";
  version = "0.1";

  #src = ./src;
  src = fetchgit {
    url = "https://git.fishoeder.net/iio-hyprland";
    rev = "b9f2f5b4f7402df8bca9705a8845b1aebe70e7c0";
    hash = "sha256-4/tSfLBOMCCJqVupQDxFljr0VAcConSJEHuEvcFA9wk=";
  };

  buildInputs = [ dbus systemd ];

  nativeBuildInputs = [ ninja meson pkg-config ];


}
