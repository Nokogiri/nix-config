{ stdenv, fetchurl, gmpxx, zlib, autoPatchelfHook, gnupg, lib }:

stdenv.mkDerivation rec {
  pname = "mailctl";
  version = "0.7.4";
  src = fetchurl {
    url =
      "https://github.com/pdobsan/mailctl/releases/download/0.7.4/mailctl-0.7.4-Linux-x86_64";
    sha256 = "sha256-nBj6vfUfScMTy4rn7qQ8bRaMsSXBiTXQCq6ngjIsU6U=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ gmpxx gnupg zlib ];
  executable = ./mailctl-0.7.4-Linux-x86_64;
  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $executable $out/bin/mailctl
  '';
}
