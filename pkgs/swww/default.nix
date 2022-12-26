{ stdenv, rustPlatform, fetchFromGitHub, lib, pkg-config, libxkbcommon }:
rustPlatform.buildRustPackage rec {
  pname = "swww";
  version = "v0.6.0";

  src = fetchFromGitHub {
    owner = "Horus645";
    repo = pname;
    rev = version;
    sha256 = "sha256-9qTKaLfVeZD8tli7gqGa6gr1a2ptQRj4sf1XSPORo1s=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libxkbcommon ];
  cargoSha256 = "sha256-78Gvabdt/pXHXRNiJELkfzY5z7seZvVn3ogRRG9pflc=";

  doCheck = false;
  meta = with lib; {
    description = "A Solution to your Wayland Wallpaper Woes";
    homepage = "https://github.com/Horus645/swww";
    license = licenses.gpl3;
    maintainers = [ maintainers.nokogiri ];
  };
}
