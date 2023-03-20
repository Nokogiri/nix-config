{ lib
, bubblewrap
, cacert
, callPackage
, fetchFromGitLab
, fetchurl
, fetchzip
, git
, imagemagick
, jre
, makeWrapper
, openmw
, perlPackages
, python3Packages
, rustPlatform
, tes3cmd
, tr-patcher
}:

let
  version = "2.5.8";

  src = fetchFromGitLab {
    owner = "portmod";
    repo = "Portmod";
    rev = "v${version}";
    hash = "sha256-HhZ83NRXLIMd4lZlnzjsh01sf1GtamxN30H1kmIJ83M=";
  };

  portmod-rust = rustPlatform.buildRustPackage rec {
    inherit src version;
    pname = "portmod-rust";

    cargoHash = "sha256-2SROQUwxChbKDFYfZNMDJ6yXS+s9ID7dqUB7l+nMTr8=";
    # cargoSha256 = "0000000000000000000000000000000000000000000000000000";

    nativeBuildInputs = [
      python3Packages.python
    ];

    doCheck = false;
  };

  bin-programs = [
    bubblewrap
    git
    python3Packages.virtualenv
    tr-patcher
    tes3cmd
    imagemagick
    openmw
  ];

in
python3Packages.buildPythonApplication rec {
  inherit src version;

  pname = "portmod";

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  # build the rust library independantly
  prePatch = ''
    substituteInPlace setup.py \
      --replace "from setuptools_rust import Binding, RustExtension, Strip" "" \
      --replace "RustExtension(\"portmodlib.portmod\", binding=Binding.PyO3, strip=Strip.Debug)" ""
  '';

  propagatedBuildInputs = with python3Packages; [
    setuptools-scm
    setuptools
    requests
    chardet
    colorama
    restrictedpython
    appdirs
    gitpython
    progressbar2
    python-sat
    redbaron
    patool
    packaging
    fasteners
  ];
  doCheck = false;
  nativeCheckInputs = with python3Packages; [
    pytestCheckHook
  ] ++ bin-programs;

  preCheck = ''
    cp ${portmod-rust}/lib/libportmod.so portmodlib/portmod.so
    export HOME=$(mktemp -d)
  '';

  # some test require network access
  disabledTests = [
    "test_masters_esp"
    "test_logging"
    "test_execute_network_permissions"
    "test_execute_permissions_bleed"
    "test_git"
    "test_sync"
    "test_manifest"
    "test_add_repo"
  ];

  # for some reason, installPhase doesn't copy the compiled binary
  postInstall = ''
    cp ${portmod-rust}/lib/libportmod.so $out/${python3Packages.python.sitePackages}/portmodlib/portmod.so

    makeWrapperArgs+=("--prefix" "GIT_SSL_CAINFO" ":" "${cacert}/etc/ssl/certs/ca-bundle.crt" \
      "--prefix" "PATH" ":" "${lib.makeBinPath bin-programs }")
  '';

  meta = with lib; {
    description = "mod manager for openMW based on portage";
    homepage = "https://gitlab.com/portmod/portmod";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ marius851000 ];
  };
}
