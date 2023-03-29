{ lib
, stdenv
, fetchFromGitHub
, fetchpatch
, qmake
, cmake
, libX11
, libXext
, qttools
, wrapQtAppsHook
, gitUpdater
, qt6
}:

stdenv.mkDerivation rec {
  pname = "qtstyleplugin-kvantum-qt6";
  version = "1.0.9";

  src = fetchFromGitHub {
    owner = "tsujan";
    repo = "Kvantum";
    rev = "V${version}";
    sha256 = "5/cScJpi5Z5Z/SjizKfMTGytuEo2uUT6QtpMnn7JhKc=";
  };

  nativeBuildInputs = [
    qmake
    cmake
    qt6.qttools
    wrapQtAppsHook
  ];

  buildInputs = [
    #qtbase
    #qtsvg
    qt6.qtbase
    qt6.qtsvg
    qt6.qttools
    #qtx11extras
    libX11
    libXext
  ];

  sourceRoot = "source/Kvantum";

  patches = [
    (fetchpatch {
      # add xdg dirs support
      url = "https://github.com/tsujan/Kvantum/commit/01989083f9ee75a013c2654e760efd0a1dea4a68.patch";
      hash = "sha256-HPx+p4Iek/Me78olty1fA0dUNceK7bwOlTYIcQu8ycc=";
      stripLen = 1;
    })
  ];

  postPatch = ''
    # Fix plugin dir
    substituteInPlace style/style.pro \
      --replace "\$\$[QT_INSTALL_PLUGINS]" "$out/lib/qt-6/plugins"
  '';

  buildPhase = ''
  #cmake -B build5
  #make -C build5

  mkdir -p build && cd build
  cmake .. -DENABLE_QT5=OFF
  make
  #cmake -B build6 -DENABLE_QT5=OFF
  #make -C build6
  '';

  installPhase = ''
  #DESTDIR=$out make install
  mkdir -p $out/lib/qt-6/plugins/styles
  cp style/libkvantum.so $out/lib/qt-6/plugins/styles/libkvantum.so
  '';
  
  passthru.updateScript = gitUpdater {
    rev-prefix = "V";
  };

  meta = with lib; {
    description = "SVG-based Qt5 theme engine plus a config tool and extra themes";
    homepage = "https://github.com/tsujan/Kvantum";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = [ maintainers.romildo ];
  };
}

