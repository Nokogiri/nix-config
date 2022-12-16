{ stdenv, fetchFromGitHub, lib }:

stdenv.mkDerivation rec {
  pname = "colloid-cursors";
  version = "2022-10-26";
  src = fetchFromGitHub ({
    owner = "vinceliuice";
    repo = "Colloid-icon-theme";
    rev = "2022-10-26";
    fetchSubmodules = false;
    sha256 = "sha256-eHLfWrtY69S37OPvQdLwI/PRvoKCheF2MRsHG5+5BR0=";
  });

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/{Colloid-Cursors,Colloid-dark-Cursors}
    cp -r cursors/dist/* $out/share/icons/Colloid-Cursors
    sed -i "s/Colloid Cursors/Colloid/g" $out/share/icons/Colloid-Cursors/index.theme
    cp -r cursors/dist-dark/* $out/share/icons/Colloid-dark-Cursors
    sed -i "s/Colloid-dark Cursors/Colloid-dark/g" $out/share/icons/Colloid-dark-Cursors/index.theme
    runHook postInstall
  '';
}

