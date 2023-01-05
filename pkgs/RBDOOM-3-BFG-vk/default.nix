{ lib
, fetchFromGitHub
, stdenv
, cmake
, ffmpeg
, openal
, SDL2
, vulkan-headers
, vulkan-loader
}:
stdenv.mkDerivation rec {
  name = "RBDOOM-3-BFG";
  version = "1.4.0";

  src = fetchFromGitHub ({
    owner = "RobertBeckebans";
    repo = "RBDOOM-3-BFG";
    rev = "v1.4.0";
    fetchSubmodules = true;
    sha256 = "sha256-r/dvTirgFXdBJ+Gjl6zpHoGCTPoo0tRmOCV9oCdnltI=";
  });

  nativeBuildInputs = [ cmake vulkan-headers ];
  buildInputs = [ ffmpeg SDL2 openal vulkan-loader ];

  configurePhase = ''
    mkdir build
    cd build
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DSDL2=ON -DUSE_VULKAN=ON -DSPIRV_SHADERC=OFF ../neo
  '';

  #buildPhase = ''
  #  mkdir build
  #  cd build
  #  cmake
  #  '';

  installPhase = ''
    mkdir -p $out/bin
    install RBDoom3BFG $out/bin/RBDoom3BFG
  '';

  enableParallelBuilding = true;

  meta = with lib; {
    description =
      "RBDOOM-3-BFG is based on DOOM-3-BFG and the goal of this port is to bring DOOM-3-BFG up to latest technology in 2021 making it closer to Doom 2016 while still remaining a DOOM 3 port regarding the gameplay.";
    homepage = "https://github.com/RobertBeckebans/RBDOOM-3-BFG";
    platforms = platforms.linux;
    maintainers = with maintainers; [ nokogiri ];
  };
}
