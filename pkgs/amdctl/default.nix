{ lib, stdenv, cmake, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "amdctl";
  version = "v0.11";
  src = fetchFromGitHub {
    owner = "kevinlekiller";
    repo = pname;
    rev = version;
    sha256 = "2wBk/9aAD7ARMGbcVxk+CzEvUf8U4RS4ZwTCj8cHNNo=";
  };

  nativeBuildInputs = [ cmake ];

  installPhase = ''
    mkdir -p $out/bin
    install -s amdctl $out/bin/amdctl
  '';

  meta = with lib; {
    description = "Set P-State voltages and clock speeds on recent AMD CPUs on Linux.";
    homepage = "https://github.com/kevinlekiller/amdctl";
    platforms = platforms.linux;
    maintainers = with maintainers; [ nokogiri ];
  };
}

