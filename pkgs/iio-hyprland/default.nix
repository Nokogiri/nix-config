{ lib
, stdenv
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

  src = ./src;

  buildInputs = [ dbus systemd ];

  nativeBuildInputs = [ ninja meson pkg-config ];

  
}
