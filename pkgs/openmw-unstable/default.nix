{ lib
, stdenv
, mkDerivation
, fetchFromGitHub
, fetchpatch
, cmake
, yaml-cpp
, pkg-config
, wrapQtAppsHook
, openscenegraph
, mygui
, bullet
, ffmpeg_4
, boost
, SDL2
, unshield
, openal
, libXt
, luajit
, lz4
, recastnavigation
  #, VideoDecodeAcceleration
}:

let
  openscenegraph_openmw = (openscenegraph.override { colladaSupport = true; }).overrideDerivation (self: {
    src = fetchFromGitHub {
      owner = "OpenMW";
      repo = "osg";
      rev = "69cfecebfb6dc703b42e8de39eed750a84a87489";
      sha256 = "sha256-gq8P1DGRzo+D96++yivb+YRjdneSNZC03h9VOp+YXuE=";
    };
    patches = [
      (fetchpatch {
        # For Darwin, OSG doesn't build some plugins as they're redundant with QuickTime.
        # OpenMW doesn't like this, and expects them to be there. Apply their patch for it.
        name = "darwin-osg-plugins-fix.patch";
        url = "https://gitlab.com/OpenMW/openmw-dep/-/raw/0abe3c9c3858211028d881d7706813d606335f72/macos/osg.patch";
        sha256 = "sha256-/CLRZofZHot8juH78VG1/qhTHPhy5DoPMN+oH8hC58U=";
      })
    ];
  });

  bullet_openmw = bullet.overrideDerivation (old: rec {
    version = "3.17";
    src = fetchFromGitHub {
      owner = "bulletphysics";
      repo = "bullet3";
      rev = version;
      sha256 = "sha256-uQ4X8F8nmagbcFh0KexrmnhHIXFSB3A1CCnjPVeHL3Q=";
    };
    patches = [ ];
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [
      "-DUSE_DOUBLE_PRECISION=ON"
      "-DBULLET2_MULTITHREADING=ON"
    ];
  });

in
mkDerivation rec {
  pname = "openmw";
  version = "48-rc10";

  src = fetchFromGitHub {
    owner = "OpenMW";
    repo = "openmw";
    rev = "${pname}-${version}";
    sha256 = "sha256-BIeCVM2O/YBgRjAedxe5/NqXpYeHggn3eSnHLgZtX80=";
  };

  #patches = [
  #  (fetchpatch {
  #    url = "https://gitlab.com/OpenMW/openmw/-/merge_requests/1239.diff";
  #    sha256 = "sha256-RhbIGeE6GyqnipisiMTwWjcFnIiR055hUPL8IkjPgZw=";
  #  })
  #];

  postPatch = ''
    sed '1i#include <memory>' -i components/myguiplatform/myguidatamanager.cpp # gcc12
  '' + lib.optionalString stdenv.isDarwin ''
    # Don't fix Darwin app bundle
    sed -i '/fixup_bundle/d' CMakeLists.txt
  '';

  nativeBuildInputs = [ cmake yaml-cpp pkg-config wrapQtAppsHook ];

  # If not set, OSG plugin .so files become shell scripts on Darwin.
  dontWrapQtApps = false;

  buildInputs = [
    SDL2
    boost
    bullet_openmw
    ffmpeg_4
    libXt
    mygui
    openal
    openscenegraph_openmw
    unshield
    lz4
    luajit
    recastnavigation
  ]; # ++ lib.optionals stdenv.isDarwin [
  # VideoDecodeAcceleration
  #];

  cmakeFlags = [
    # as of 0.46, openmw is broken with GLVND
    "-DOpenGL_GL_PREFERENCE=LEGACY"
    "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
    "-DOPENMW_USE_SYSTEM_RECASTNAVIGATION=1"
  ] ++ lib.optionals stdenv.isDarwin [
    "-DOPENMW_OSX_DEPLOYMENT=ON"
  ];

  meta = with lib; {
    description = "An unofficial open source engine reimplementation of the game Morrowind";
    homepage = "https://openmw.org";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ abbradar marius851000 ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
